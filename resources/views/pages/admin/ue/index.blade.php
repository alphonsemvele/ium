<?php
use function Laravel\Folio\{name, middleware};
use Livewire\Volt\Component;
use App\Models\Ue;
use App\Models\Cycle;
use App\Models\Filiere;
use App\Models\Specialite;
use App\Models\Examen;
use Illuminate\Support\Str;

name('admin.ue.index');
middleware(['auth', 'verified']);

new class extends Component {
    public $ues = [];
    public $cycles = [];
    public $filieres = [];
    public $specialites = [];
    public $examens = [];

    public bool $showAddModal = false;
    public bool $showEditModal = false;
    public bool $showDeleteModal = false;
    public bool $showActivateModal = false;
    public bool $showDeactivateModal = false;

    public $ueElement = null;

    public bool $showNotification = false;
    public string $notificationMessage = '';
    public string $notificationType = '';
    public array $formErrors = [];

    public string $name = '';
    public string $code = '';
    public $filiere_id = null;
    public $cycle_id = null;
    public $specialite_id = null;
    public $examen_id = null;
    public $credits = 0;
    public string $status = 'Success';

    public function mount()
    {
        $this->loadData();
    }

    public function loadData()
    {
        try {
            $this->ues = Ue::with(['filiere', 'filiere.cycle', 'specialite', 'examen'])
                ->where('status', '!=', 'failed')
                ->get();

            $this->cycles   = Cycle::where('status', 'Success')->get();
            $this->filieres = Filiere::with('cycle')->where('status', 'Success')->get();
            $this->specialites = collect();
            $this->examens  = Examen::where('statut', '!=', 'annule')->get();

        } catch (\Exception $e) {
            logger('Erreur loadData UE: ' . $e->getMessage());
            $this->ues         = collect();
            $this->filieres    = collect();
            $this->specialites = collect();
            $this->examens     = collect();
        }
    }

    public function updatedFiliereId($value)
    {
        $this->specialite_id = null;
        $this->cycle_id      = null;

        if ($value) {
            $filiere = Filiere::find($value);
            if ($filiere) {
                $this->cycle_id    = $filiere->cycle_id;
                $this->specialites = Specialite::where('status', 'Success')
                    ->where('filiere_id', $value)->get();
            }
        } else {
            $this->specialites = collect();
        }
    }

    public function openAddModal()
    {
        $this->resetForm();
        $this->showAddModal = true;
        $this->formErrors   = [];
    }

    public function openEditModal($id)
    {
        try {
            $this->ueElement = Ue::with(['filiere', 'filiere.cycle', 'specialite', 'examen'])->findOrFail($id);

            $this->name          = $this->ueElement->name ?? '';
            $this->code          = $this->ueElement->code ?? '';
            $this->credits       = $this->ueElement->credits ?? 0;
            $this->filiere_id    = $this->ueElement->filiere_id;
            $this->cycle_id      = $this->ueElement->cycle_id;
            $this->specialite_id = $this->ueElement->specialite_id;
            $this->examen_id     = $this->ueElement->examen_id;
            $this->status        = $this->ueElement->status ?? 'Success';

            $this->specialites = Specialite::where('status', 'Success')
                ->where('filiere_id', $this->filiere_id)->get();

            $this->showEditModal = true;
            $this->formErrors    = [];
        } catch (\Exception $e) {
            logger('Erreur openEditModal UE: ' . $e->getMessage());
            $this->addError('general', 'Erreur lors de l\'ouverture du modal d\'édition');
        }
    }

    public function openActivateModal($id)
    {
        $this->ueElement         = Ue::findOrFail($id);
        $this->showActivateModal = true;
    }

    public function openDeactivateModal($id)
    {
        $this->ueElement           = Ue::findOrFail($id);
        $this->showDeactivateModal = true;
    }

    public function openDeleteModal($id)
    {
        $this->ueElement       = Ue::findOrFail($id);
        $this->showDeleteModal = true;
    }

    public function save()
    {
        try {
            $this->validate([
                'name'          => 'required|string|max:255',
                'filiere_id'    => 'required|exists:filieres,id',
                'specialite_id' => 'nullable|exists:specialites,id',
                'examen_id'     => 'nullable|exists:examens,id',
                'credits'       => 'required|integer|min:0|max:30',
                'status'        => 'required|in:Success,pending,failed',
            ]);

            $filiere  = Filiere::find($this->filiere_id);
            $cycle_id = $filiere ? $filiere->cycle_id : null;
            $code     = 'UE-' . Str::upper(Str::random(6));

            Ue::create([
                'name'          => $this->name,
                'code'          => $code,
                'filiere_id'    => $this->filiere_id,
                'cycle_id'      => $cycle_id,
                'specialite_id' => $this->specialite_id ?: null,
                'examen_id'     => $this->examen_id ?: null,
                'credits'       => $this->credits,
                'status'        => $this->status,
            ]);

            $this->resetForm();
            $this->showAddModal = false;
            $this->loadData();
            $this->showSuccessNotification('UE ajoutée avec succès !');
        } catch (\Illuminate\Validation\ValidationException $e) {
            $this->formErrors = $e->errors();
        } catch (\Exception $e) {
            logger('Erreur save UE: ' . $e->getMessage());
            $this->addError('general', 'Erreur lors de la création');
        }
    }

    public function update()
    {
        try {
            $this->validate([
                'name'          => 'required|string|max:255',
                'code'          => 'required|string|max:50|unique:ues,code,' . $this->ueElement->id,
                'filiere_id'    => 'required|exists:filieres,id',
                'specialite_id' => 'nullable|exists:specialites,id',
                'examen_id'     => 'nullable|exists:examens,id',
                'credits'       => 'required|integer|min:0|max:30',
                'status'        => 'required|in:Success,pending,failed',
            ]);

            $filiere  = Filiere::find($this->filiere_id);
            $cycle_id = $filiere ? $filiere->cycle_id : null;

            $this->ueElement->update([
                'name'          => $this->name,
                'code'          => strtoupper($this->code),
                'filiere_id'    => $this->filiere_id,
                'cycle_id'      => $cycle_id,
                'specialite_id' => $this->specialite_id ?: null,
                'examen_id'     => $this->examen_id ?: null,
                'credits'       => $this->credits,
                'status'        => $this->status,
            ]);

            $this->resetForm();
            $this->showEditModal = false;
            $this->ueElement     = null;
            $this->loadData();
            $this->showSuccessNotification('UE modifiée avec succès !');
        } catch (\Illuminate\Validation\ValidationException $e) {
            $this->formErrors = $e->errors();
        } catch (\Exception $e) {
            logger('Erreur update UE: ' . $e->getMessage());
            $this->addError('general', 'Erreur lors de la mise à jour');
        }
    }

    public function activate($id)
    {
        try {
            Ue::findOrFail($id)->update(['status' => 'Success']);
            $this->closeModal();
            $this->loadData();
            $this->showSuccessNotification('UE activée !');
        } catch (\Exception $e) {
            $this->addError('general', 'Erreur activation');
        }
    }

    public function deactivate($id)
    {
        try {
            Ue::findOrFail($id)->update(['status' => 'pending']);
            $this->closeModal();
            $this->loadData();
            $this->showSuccessNotification('UE désactivée !');
        } catch (\Exception $e) {
            $this->addError('general', 'Erreur désactivation');
        }
    }

    public function delete($id)
    {
        try {
            Ue::findOrFail($id)->update(['status' => 'failed']);
            $this->closeModal();
            $this->loadData();
            $this->showSuccessNotification('UE supprimée !');
        } catch (\Exception $e) {
            $this->addError('general', 'Erreur suppression');
        }
    }

    public function closeModal()
    {
        $this->showAddModal        = false;
        $this->showEditModal       = false;
        $this->showDeleteModal     = false;
        $this->showActivateModal   = false;
        $this->showDeactivateModal = false;
        $this->ueElement           = null;
        $this->resetForm();
    }

    private function resetForm()
    {
        $this->name          = '';
        $this->code          = '';
        $this->credits       = 0;
        $this->filiere_id    = null;
        $this->cycle_id      = null;
        $this->specialite_id = null;
        $this->examen_id     = null;
        $this->status        = 'Success';
        $this->specialites   = collect();
        $this->formErrors    = [];
    }

    private function showSuccessNotification($message)
    {
        $this->notificationMessage = $message;
        $this->notificationType    = 'success';
        $this->showNotification    = true;
    }
};
?>

<x-layouts.app header="true">
    @volt
    <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-12">

        <!-- Header -->
        <header class="mb-12 text-center">
            <h1 class="text-4xl font-bold text-gray-900 bg-gradient-to-r from-indigo-600 to-purple-600 bg-clip-text text-transparent tracking-tight">
                Gestion des Unités d'Enseignement
            </h1>
            <p class="mt-3 text-base text-gray-600">Créez, modifiez, activez, désactivez ou supprimez des unités d'enseignement</p>
        </header>

        <!-- Bouton Ajouter -->
        <div class="mb-8 text-center">
            <button wire:click="openAddModal" type="button"
                class="bg-indigo-600 text-white py-3 px-8 rounded-xl hover:bg-indigo-700 transition duration-300 shadow-lg">
                <svg class="w-5 h-5 inline-block mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 4v16m8-8H4" />
                </svg>
                Ajouter une UE
            </button>
        </div>

        @error('general')
            <div class="mb-4 p-4 bg-red-100 text-red-700 rounded-lg border-l-4 border-red-500">
                {{ $message }}
            </div>
        @enderror

        <!-- Statistiques -->
        <div class="grid grid-cols-1 md:grid-cols-2 gap-6 mb-8">
            <div class="bg-white rounded-2xl shadow-lg p-6 text-center">
                <h3 class="text-lg font-semibold text-gray-800">Total UE</h3>
                <p class="text-3xl font-bold text-indigo-600">{{ count($ues) }}</p>
            </div>
            <div class="bg-white rounded-2xl shadow-lg p-6 text-center">
                <h3 class="text-lg font-semibold text-gray-800">UE Actives</h3>
                <p class="text-3xl font-bold text-green-600">
                    {{ collect($ues)->where('status', 'Success')->count() }}
                </p>
            </div>
        </div>

        <!-- Liste des UE -->
        <div class="bg-white rounded-2xl shadow-lg p-8">
            <h2 class="text-2xl font-semibold text-gray-800 mb-6">Liste des Unités d'Enseignement</h2>

            @if(count($ues) > 0)
                <div class="overflow-x-auto">
                    <table class="w-full text-left border-separate border-spacing-y-2">
                        <thead>
                            <tr class="bg-gray-100 rounded-lg">
                                <th class="p-4 text-sm font-medium text-gray-600">Nom</th>
                                <th class="p-4 text-sm font-medium text-gray-600">Code</th>
                                <th class="p-4 text-sm font-medium text-gray-600">Crédits</th>
                                <th class="p-4 text-sm font-medium text-gray-600">Spécialité</th>
                                <th class="p-4 text-sm font-medium text-gray-600">Examen lié</th>
                                <th class="p-4 text-sm font-medium text-gray-600">Filière</th>
                                <th class="p-4 text-sm font-medium text-gray-600">Cycle</th>
                                <th class="p-4 text-sm font-medium text-gray-600">Statut</th>
                                <th class="p-4 text-sm font-medium text-gray-600">Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            @foreach ($ues as $ue)
                                <tr class="bg-gray-50 rounded-lg hover:bg-gray-100 transition duration-200">
                                    <td class="p-4">{{ $ue->name ?? 'Non défini' }}</td>
                                    <td class="p-4">
                                        <span class="font-mono text-xs bg-indigo-50 text-indigo-700 px-2 py-1 rounded">
                                            {{ $ue->code ?? '—' }}
                                        </span>
                                    </td>
                                    <td class="p-4">{{ $ue->credits ?? 0 }} crédits</td>
                                    <td class="p-4">{{ $ue->specialite->name ?? '—' }}</td>
                                    <td class="p-4">
                                        @if ($ue->examen)
                                            <span class="inline-flex items-center gap-1 text-xs bg-purple-50 text-purple-700 px-2 py-1 rounded-full font-medium">
                                                <svg class="w-3 h-3" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                                        d="M9 12h6m-6 4h6m2 5H7a2 2 0 01-2-2V5a2 2 0 012-2h5.586a1 1 0 01.707.293l5.414 5.414a1 1 0 01.293.707V19a2 2 0 01-2 2z" />
                                                </svg>
                                                {{ $ue->examen->titre }}
                                            </span>
                                        @else
                                            <span class="text-gray-400">—</span>
                                        @endif
                                    </td>
                                    <td class="p-4">{{ $ue->filiere->name ?? 'Non défini' }}</td>
                                    <td class="p-4">{{ $ue->filiere->cycle->name ?? 'N/A' }}</td>
                                    <td class="p-4">
                                        <span class="inline-block px-3 py-1 text-xs font-medium rounded-full
                                            {{ $ue->status === 'Success' ? 'bg-green-100 text-green-800' : 'bg-yellow-100 text-yellow-800' }}">
                                            {{ $ue->status === 'Success' ? 'Actif' : 'En attente' }}
                                        </span>
                                    </td>
                                    <td class="p-4 flex space-x-2">
                                        @if ($ue->status === 'pending')
                                            <button wire:click="openActivateModal({{ $ue->id }})" type="button"
                                                class="px-3 py-1 bg-green-600 text-white text-sm rounded hover:bg-green-700">
                                                Activer
                                            </button>
                                        @else
                                            <button wire:click="openDeactivateModal({{ $ue->id }})" type="button"
                                                class="px-3 py-1 bg-yellow-600 text-white text-sm rounded hover:bg-yellow-700">
                                                Désactiver
                                            </button>
                                        @endif
                                        <button wire:click="openEditModal({{ $ue->id }})" type="button"
                                            class="px-3 py-1 bg-indigo-600 text-white text-sm rounded hover:bg-indigo-700">
                                            Modifier
                                        </button>
                                        <button wire:click="openDeleteModal({{ $ue->id }})" type="button"
                                            class="px-3 py-1 bg-red-600 text-white text-sm rounded hover:bg-red-700">
                                            Supprimer
                                        </button>
                                    </td>
                                </tr>
                            @endforeach
                        </tbody>
                    </table>
                </div>
            @else
                <p class="text-center text-gray-500">Aucune unité d'enseignement trouvée.</p>
            @endif
        </div>

        {{-- ─── Modal Ajouter ─── --}}
        @if ($showAddModal)
            <div class="fixed inset-0 bg-gray-900 bg-opacity-60 flex items-start justify-center z-50 overflow-y-auto p-4">
                <div class="bg-white rounded-2xl p-8 w-full max-w-xl shadow-2xl my-auto">
                    <h2 class="text-3xl font-bold text-gray-800 mb-6">Ajouter une Unité d'Enseignement</h2>

                    @if (!empty($formErrors))
                        <div class="mb-4 p-4 bg-red-100 text-red-700 rounded-xl border-l-4 border-red-500">
                            <strong>Erreurs :</strong>
                            <ul class="list-disc ml-5 mt-2">
                                @foreach ($formErrors as $field => $errors)
                                    @foreach ((array)$errors as $error)
                                        <li>{{ $error }}</li>
                                    @endforeach
                                @endforeach
                            </ul>
                        </div>
                    @endif

                    <form wire:submit="save">
                        <div class="grid grid-cols-1 gap-6">

                            <div>
                                <label class="block text-sm font-medium text-gray-700">Filière</label>
                                <select wire:model.live="filiere_id" required
                                    class="mt-2 w-full p-3 border border-gray-300 rounded-xl focus:ring-2 focus:ring-indigo-500">
                                    <option value="">Sélectionner une filière</option>
                                    @foreach ($filieres as $filiere)
                                        <option value="{{ $filiere->id }}">{{ $filiere->name }}</option>
                                    @endforeach
                                </select>
                            </div>

                            <div>
                                <label class="block text-sm font-medium text-gray-700">Spécialité</label>
                                <select wire:model="specialite_id"
                                    class="mt-2 w-full p-3 border border-gray-300 rounded-xl focus:ring-2 focus:ring-indigo-500">
                                    <option value="">— Optionnel —</option>
                                    @foreach ($specialites as $specialite)
                                        <option value="{{ $specialite->id }}">{{ $specialite->name }}</option>
                                    @endforeach
                                </select>
                            </div>

                            <div>
                                <label class="block text-sm font-medium text-gray-700">Examen lié</label>
                                <select wire:model="examen_id"
                                    class="mt-2 w-full p-3 border border-gray-300 rounded-xl focus:ring-2 focus:ring-indigo-500">
                                    <option value="">— Optionnel —</option>
                                    @foreach ($examens as $examen)
                                        <option value="{{ $examen->id }}">
                                            {{ $examen->titre }}
                                            @if ($examen->date)
                                                ({{ \Carbon\Carbon::parse($examen->date)->format('d/m/Y') }})
                                            @endif
                                        </option>
                                    @endforeach
                                </select>
                            </div>

                            <div>
                                <label class="block text-sm font-medium text-gray-700">Nom de l'UE</label>
                                <input type="text" wire:model="name" required
                                    class="mt-2 w-full p-3 border border-gray-300 rounded-xl focus:ring-2 focus:ring-indigo-500">
                            </div>

                            <div>
                                <label class="block text-sm font-medium text-gray-700">Nombre de crédits</label>
                                <input type="number" wire:model="credits" required min="0" max="30"
                                    class="mt-2 w-full p-3 border border-gray-300 rounded-xl focus:ring-2 focus:ring-indigo-500">
                            </div>

                            <div>
                                <label class="block text-sm font-medium text-gray-700">Statut</label>
                                <select wire:model="status" required
                                    class="mt-2 w-full p-3 border border-gray-300 rounded-xl focus:ring-2 focus:ring-indigo-500">
                                    <option value="Success">Actif</option>
                                    <option value="pending">En attente</option>
                                    <option value="failed">Supprimé</option>
                                </select>
                            </div>

                        </div>

                        <div class="mt-8 flex justify-end space-x-4">
                            <button type="submit"
                                class="bg-indigo-600 text-white py-3 px-6 rounded-xl hover:bg-indigo-700">
                                Enregistrer
                            </button>
                            <button type="button" wire:click="closeModal"
                                class="bg-gray-500 text-white py-3 px-6 rounded-xl hover:bg-gray-600">
                                Annuler
                            </button>
                        </div>
                    </form>
                </div>
            </div>
        @endif

        {{-- ─── Modal Modifier ─── --}}
        @if ($showEditModal && $ueElement)
            <div class="fixed inset-0 bg-gray-900 bg-opacity-60 flex items-start justify-center z-50 overflow-y-auto p-4">
                <div class="bg-white rounded-2xl p-8 w-full max-w-xl shadow-2xl my-auto">
                    <h2 class="text-3xl font-bold text-gray-800 mb-6">Modifier l'Unité d'Enseignement</h2>

                    @if (!empty($formErrors))
                        <div class="mb-4 p-4 bg-red-100 text-red-700 rounded-xl border-l-4 border-red-500">
                            <strong>Erreurs :</strong>
                            <ul class="list-disc ml-5 mt-2">
                                @foreach ($formErrors as $field => $errors)
                                    @foreach ((array)$errors as $error)
                                        <li>{{ $error }}</li>
                                    @endforeach
                                @endforeach
                            </ul>
                        </div>
                    @endif

                    <form wire:submit="update">
                        <div class="grid grid-cols-1 gap-6">

                            <div>
                                <label class="block text-sm font-medium text-gray-700">Filière</label>
                                <select wire:model.live="filiere_id" required
                                    class="mt-2 w-full p-3 border border-gray-300 rounded-xl focus:ring-2 focus:ring-indigo-500">
                                    <option value="">Sélectionner une filière</option>
                                    @foreach ($filieres as $filiere)
                                        <option value="{{ $filiere->id }}">{{ $filiere->name }}</option>
                                    @endforeach
                                </select>
                            </div>

                            <div>
                                <label class="block text-sm font-medium text-gray-700">Spécialité</label>
                                <select wire:model="specialite_id"
                                    class="mt-2 w-full p-3 border border-gray-300 rounded-xl focus:ring-2 focus:ring-indigo-500">
                                    <option value="">— Optionnel —</option>
                                    @foreach ($specialites as $specialite)
                                        <option value="{{ $specialite->id }}">{{ $specialite->name }}</option>
                                    @endforeach
                                </select>
                            </div>

                            <div>
                                <label class="block text-sm font-medium text-gray-700">Examen lié</label>
                                <select wire:model="examen_id"
                                    class="mt-2 w-full p-3 border border-gray-300 rounded-xl focus:ring-2 focus:ring-indigo-500">
                                    <option value="">— Optionnel —</option>
                                    @foreach ($examens as $examen)
                                        <option value="{{ $examen->id }}">
                                            {{ $examen->titre }}
                                            @if ($examen->date)
                                                ({{ \Carbon\Carbon::parse($examen->date)->format('d/m/Y') }})
                                            @endif
                                        </option>
                                    @endforeach
                                </select>
                                @if(isset($formErrors['examen_id']))
                                    <p class="text-xs text-red-500 mt-1">{{ $formErrors['examen_id'][0] }}</p>
                                @endif
                            </div>

                            <div>
                                <label class="block text-sm font-medium text-gray-700">Nom de l'UE</label>
                                <input type="text" wire:model="name" required
                                    class="mt-2 w-full p-3 border border-gray-300 rounded-xl focus:ring-2 focus:ring-indigo-500">
                            </div>

                            <div>
                                <label class="block text-sm font-medium text-gray-700">
                                    Code
                                    <span class="text-xs text-gray-400 font-normal ml-1">(sera mis en majuscules)</span>
                                </label>
                                <input type="text" wire:model="code" required
                                    placeholder="ex: UE-ABC123"
                                    class="mt-2 w-full p-3 border border-gray-300 rounded-xl focus:ring-2 focus:ring-indigo-500 font-mono uppercase">
                                @if(isset($formErrors['code']))
                                    <p class="text-xs text-red-500 mt-1">{{ $formErrors['code'][0] }}</p>
                                @endif
                            </div>

                            <div>
                                <label class="block text-sm font-medium text-gray-700">Nombre de crédits</label>
                                <input type="number" wire:model="credits" required min="0" max="30"
                                    class="mt-2 w-full p-3 border border-gray-300 rounded-xl focus:ring-2 focus:ring-indigo-500">
                            </div>

                            <div>
                                <label class="block text-sm font-medium text-gray-700">Statut</label>
                                <select wire:model="status" required
                                    class="mt-2 w-full p-3 border border-gray-300 rounded-xl focus:ring-2 focus:ring-indigo-500">
                                    <option value="Success">Actif</option>
                                    <option value="pending">En attente</option>
                                    <option value="failed">Supprimé</option>
                                </select>
                            </div>

                        </div>

                        <div class="mt-8 flex justify-end space-x-4">
                            <button type="submit"
                                class="bg-indigo-600 text-white py-3 px-6 rounded-xl hover:bg-indigo-700">
                                Mettre à jour
                            </button>
                            <button type="button" wire:click="closeModal"
                                class="bg-gray-500 text-white py-3 px-6 rounded-xl hover:bg-gray-600">
                                Annuler
                            </button>
                        </div>
                    </form>
                </div>
            </div>
        @endif

        {{-- ─── Modal Activer ─── --}}
        @if ($showActivateModal && $ueElement)
            <div class="fixed inset-0 bg-gray-900 bg-opacity-60 flex items-center justify-center z-50">
                <div class="bg-white rounded-2xl p-6 w-full max-w-md shadow-2xl">
                    <h3 class="text-xl font-semibold text-gray-800 mb-4">Activer l'UE</h3>
                    <p class="mb-6 text-gray-600">Voulez-vous activer "{{ $ueElement->name }}" ?</p>
                    <div class="flex justify-end space-x-4">
                        <button wire:click="activate({{ $ueElement->id }})"
                            class="bg-green-600 text-white py-2 px-4 rounded-xl hover:bg-green-700">Oui</button>
                        <button wire:click="closeModal"
                            class="bg-gray-500 text-white py-2 px-4 rounded-xl hover:bg-gray-600">Annuler</button>
                    </div>
                </div>
            </div>
        @endif

        {{-- ─── Modal Désactiver ─── --}}
        @if ($showDeactivateModal && $ueElement)
            <div class="fixed inset-0 bg-gray-900 bg-opacity-60 flex items-center justify-center z-50">
                <div class="bg-white rounded-2xl p-6 w-full max-w-md shadow-2xl">
                    <h3 class="text-xl font-semibold text-gray-800 mb-4">Désactiver l'UE</h3>
                    <p class="mb-6 text-gray-600">Voulez-vous désactiver "{{ $ueElement->name }}" ?</p>
                    <div class="flex justify-end space-x-4">
                        <button wire:click="deactivate({{ $ueElement->id }})"
                            class="bg-yellow-600 text-white py-2 px-4 rounded-xl hover:bg-yellow-700">Oui</button>
                        <button wire:click="closeModal"
                            class="bg-gray-500 text-white py-2 px-4 rounded-xl hover:bg-gray-600">Annuler</button>
                    </div>
                </div>
            </div>
        @endif

        {{-- ─── Modal Supprimer ─── --}}
        @if ($showDeleteModal && $ueElement)
            <div class="fixed inset-0 bg-gray-900 bg-opacity-60 flex items-center justify-center z-50">
                <div class="bg-white rounded-2xl p-6 w-full max-w-md shadow-2xl">
                    <h3 class="text-xl font-semibold text-gray-800 mb-4">Supprimer l'UE</h3>
                    <p class="mb-6 text-gray-600">
                        Voulez-vous supprimer "{{ $ueElement->name }}" ? Cette action est irréversible.
                    </p>
                    <div class="flex justify-end space-x-4">
                        <button wire:click="delete({{ $ueElement->id }})"
                            class="bg-red-600 text-white py-2 px-4 rounded-xl hover:bg-red-700">Oui</button>
                        <button wire:click="closeModal"
                            class="bg-gray-500 text-white py-2 px-4 rounded-xl hover:bg-gray-600">Annuler</button>
                    </div>
                </div>
            </div>
        @endif

        {{-- ─── Notification toast ─── --}}
        @if ($showNotification)
            <div class="fixed top-6 right-6 z-50 max-w-sm w-full"
                x-data="{ show: true }"
                x-init="setTimeout(() => { show = false; $wire.set('showNotification', false); }, 3000)"
                x-show="show"
                x-transition:enter="transition ease-out duration-300"
                x-transition:enter-start="opacity-0 translate-y-2"
                x-transition:enter-end="opacity-100 translate-y-0"
                x-transition:leave="transition ease-in duration-200"
                x-transition:leave-start="opacity-100"
                x-transition:leave-end="opacity-0">
                <div class="flex items-center gap-3 p-4 rounded-xl shadow-lg border-l-4
                    {{ $notificationType === 'success'
                        ? 'bg-green-50 text-green-700 border-green-500'
                        : 'bg-red-50 text-red-700 border-red-500' }}">
                    @if ($notificationType === 'success')
                        <svg class="w-5 h-5 flex-shrink-0" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 13l4 4L19 7" />
                        </svg>
                    @else
                        <svg class="w-5 h-5 flex-shrink-0" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12" />
                        </svg>
                    @endif
                    <span class="text-sm font-medium">{{ $notificationMessage }}</span>
                </div>
            </div>
        @endif

    </div>
    @endvolt
</x-layouts.app>