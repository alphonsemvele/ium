<?php
use function Laravel\Folio\{name, middleware};
use Livewire\Volt\Component;
use App\Models\Filiere;
use App\Models\Departement;
use App\Models\Cycle;
use App\Models\User;
use Illuminate\Support\Str;

name('admin.filieres');
middleware(['auth', 'verified']);

new class extends Component {
    public $filieres = [];
    public $cycles = [];
    public $departements = [];
    public $filteredDepartements = []; // Départements filtrés par cycle
    public $specialitesCount = [];

    public $name = '';
    public $description = '';
    public $cycle_id = null;
    public $departement_id = null;
    public $status = 'Success';

    public $showCreateModal = false;
    public $showEditModal = false;
    public $showDeleteModal = false;
    public $showActivateModal = false;
    public $showDeactivateModal = false;
    public $showDetailsModal = false;

    public $filiereElement;

    public bool $showNotification = false;
    public string $notificationMessage = '';
    public string $notificationType = '';
    public array $formErrors = [];

    public function mount()
    {
        $this->loadData();
    }

    public function loadData()
    {
        $this->filieres = Filiere::with(['departement.cycle', 'specialites'])
            ->where('status', '!=', 'failed')
            ->get();

        $this->cycles = Cycle::where('status', 'Success')
            ->orderBy('name')
            ->get(['id', 'name']);

        $this->departements = Departement::where('status', 'Success')
            ->orderBy('nom')
            ->get(['id', 'nom', 'cycle_id']);

        foreach ($this->filieres as $f) {
            $this->specialitesCount[$f->id] = $f->specialites->count();
        }
    }

    // Appelé automatiquement quand cycle_id change
    public function updatedCycleId($value)
    {
        $this->departement_id = null;
        $this->filteredDepartements = $this->departements
            ->where('cycle_id', $value)
            ->values();
    }

    public function functionShowCreateModal()
    {
        $this->resetForm();
        $this->showCreateModal = true;
        $this->formErrors = [];
    }

    public function functionShowEditModal($id)
    {
        $this->filiereElement = Filiere::with('departement.cycle')->findOrFail($id);

        $this->name = $this->filiereElement->name;
        $this->description = $this->filiereElement->description;
        $this->departement_id = $this->filiereElement->departement_id;
        $this->status = $this->filiereElement->status;

        // Pré-remplir le cycle et filtrer les départements
        if ($this->filiereElement->departement) {
            $this->cycle_id = $this->filiereElement->departement->cycle_id;
            $this->filteredDepartements = $this->departements
                ->where('cycle_id', $this->cycle_id)
                ->values();
        }

        $this->showEditModal = true;
        $this->formErrors = [];
    }

    public function functionShowDetailsModal($id)
    {
        $this->filiereElement = Filiere::with(['departement.cycle', 'specialites'])->findOrFail($id);
        $this->showDetailsModal = true;
    }

    public function functionShowDeleteModal($id)
    {
        $this->filiereElement = Filiere::findOrFail($id);
        $this->showDeleteModal = true;
    }

    public function functionShowActivateModal($id)
    {
        $this->filiereElement = Filiere::findOrFail($id);
        $this->showActivateModal = true;
    }

    public function functionShowDeactivateModal($id)
    {
        $this->filiereElement = Filiere::findOrFail($id);
        $this->showDeactivateModal = true;
    }

    public function save()
    {
        $rules = [
            'name' => 'required|string|max:255',
            'description' => 'nullable|string|max:2000',
            'cycle_id' => 'required|exists:cycles,id',
            'departement_id' => 'required|exists:departements,id',
            'status' => 'required|in:pending,Success,completed',
        ];

        $validated = $this->validate($rules);

        $code = 'FIL-' . Str::upper(Str::random(6));

        Filiere::create([
            'name' => $this->name,
            'code' => $code,
             'cycle_id' => $this->cycle_id, 
            'description' => $this->description,
            'departement_id' => $this->departement_id,
            'status' => $this->status,
        ]);

        $this->resetForm();
        $this->showCreateModal = false;
        $this->loadData();
        $this->showSuccessNotification('Filière créée avec succès !');
    }

    public function update()
    {
        $rules = [
            'name' => 'required|string|max:255|unique:filieres,name,' . $this->filiereElement->id,
            'description' => 'nullable|string|max:2000',
            'cycle_id' => 'required|exists:cycles,id',
            'departement_id' => 'required|exists:departements,id',
            'status' => 'required|in:pending,Success,completed',
        ];

        $validated = $this->validate($rules);

        $this->filiereElement->update([
            'name' => $this->name,
             'cycle_id' => $this->cycle_id, 
            'description' => $this->description,
            'departement_id' => $this->departement_id,
            'status' => $this->status,
        ]);

        $this->resetForm();
        $this->showEditModal = false;
        $this->filiereElement = null;
        $this->loadData();
        $this->showSuccessNotification('Filière modifiée avec succès !');
    }

    public function activateFiliere()
    {
        $this->filiereElement->update(['status' => 'Success']);
        $this->showActivateModal = false;
        $this->loadData();
        $this->showSuccessNotification('Filière activée !');
    }

    public function deactivateFiliere()
    {
        $this->filiereElement->update(['status' => 'pending']);
        $this->showDeactivateModal = false;
        $this->loadData();
        $this->showSuccessNotification('Filière désactivée !');
    }

    public function deleteFiliere()
    {
        $this->filiereElement->update(['status' => 'failed']);
        $this->showDeleteModal = false;
        $this->loadData();
        $this->showSuccessNotification('Filière supprimée !');
    }

    public function closeModal()
    {
        $this->showCreateModal = false;
        $this->showEditModal = false;
        $this->showDeleteModal = false;
        $this->showActivateModal = false;
        $this->showDeactivateModal = false;
        $this->showDetailsModal = false;
        $this->filiereElement = null;
        $this->resetForm();
    }

    private function resetForm()
    {
        $this->name = '';
        $this->description = '';
        $this->cycle_id = null;
        $this->departement_id = null;
        $this->filteredDepartements = [];
        $this->status = 'Success';
        $this->formErrors = [];
    }

    private function showSuccessNotification($message)
    {
        $this->notificationMessage = $message;
        $this->notificationType = 'success';
        $this->showNotification = true;
    }
};
?>

<x-layouts.app header="true">
@volt
<div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-12">
    <!-- Header -->
    <header class="mb-12 text-center">
        <h1 class="text-4xl font-bold text-gray-900 bg-gradient-to-r from-indigo-600 to-purple-600 bg-clip-text text-transparent">
            Gestion des Filières
        </h1>
        <p class="mt-3 text-lg text-gray-600">Créez et gérez les filières rattachées aux départements.</p>
        <button wire:click="functionShowCreateModal"
            class="mt-6 bg-indigo-600 text-white py-3 px-8 rounded-xl hover:bg-indigo-700 transition shadow-lg">
            + Nouvelle Filière
        </button>
    </header>

    <!-- Modal Créer / Modifier -->
    @if ($showCreateModal || $showEditModal)
        <div class="fixed inset-0 bg-gray-900 bg-opacity-60 flex items-center justify-center z-50">
            <div class="bg-white rounded-2xl p-8 w-full max-w-xl max-h-[90vh] overflow-y-auto shadow-2xl">
                <h2 class="text-2xl font-semibold text-gray-800 mb-6">
                    {{ $showEditModal ? 'Modifier la filière' : 'Ajouter une filière' }}
                </h2>

                @if (!empty($formErrors))
                    <div class="mb-6 p-4 bg-red-50 border-l-4 border-red-500 text-red-700 rounded">
                        <ul class="list-disc pl-5 space-y-1">
                            @foreach ($formErrors as $field => $messages)
                                @foreach ((array)$messages as $msg)
                                    <li>{{ ucfirst($field) }} : {{ $msg }}</li>
                                @endforeach
                            @endforeach
                        </ul>
                    </div>
                @endif

                <form wire:submit="{{ $showEditModal ? 'update' : 'save' }}">
                    <div class="space-y-6">
                        <!-- Nom -->
                        <div>
                            <label class="block text-sm font-medium text-gray-700">Nom de la filière *</label>
                            <input wire:model="name" type="text" required
                                class="mt-1 block w-full rounded-lg border-gray-300 shadow-sm focus:border-indigo-500 focus:ring-indigo-500">
                            @error('name') <p class="mt-1 text-sm text-red-600">{{ $message }}</p> @enderror
                        </div>

                        <!-- Description -->
                        <div>
                            <label class="block text-sm font-medium text-gray-700">Description</label>
                            <textarea wire:model="description" rows="3"
                                class="mt-1 block w-full rounded-lg border-gray-300 shadow-sm focus:border-indigo-500 focus:ring-indigo-500"></textarea>
                        </div>

                        <!-- Cycle -->
                        <div>
                            <label class="block text-sm font-medium text-gray-700">Cycle *</label>
                            <select wire:model.live="cycle_id" required
                                class="mt-1 block w-full rounded-lg border-gray-300 shadow-sm focus:border-indigo-500 focus:ring-indigo-500">
                                <option value="">— Sélectionner un cycle —</option>
                                @foreach ($cycles as $cycle)
                                    <option value="{{ $cycle->id }}">{{ $cycle->name }}</option>
                                @endforeach
                            </select>
                            @error('cycle_id') <p class="mt-1 text-sm text-red-600">{{ $message }}</p> @enderror
                        </div>

                        <!-- Département (filtré selon le cycle) -->
                        <div>
                            <label class="block text-sm font-medium text-gray-700">Département *</label>
                            <select wire:model="departement_id" required
                                @if(!$cycle_id) disabled @endif
                                class="mt-1 block w-full rounded-lg border-gray-300 shadow-sm focus:border-indigo-500 focus:ring-indigo-500 disabled:bg-gray-100 disabled:cursor-not-allowed">
                                <option value="">
                                    {{ $cycle_id ? '— Sélectionner un département —' : '— Choisissez d\'abord un cycle —' }}
                                </option>
                                @foreach ($filteredDepartements as $dep)
                                    <option value="{{ $dep->id }}">{{ $dep->nom }}</option>
                                @endforeach
                            </select>
                            @error('departement_id') <p class="mt-1 text-sm text-red-600">{{ $message }}</p> @enderror

                            @if ($cycle_id && count($filteredDepartements) === 0)
                                <p class="mt-1 text-sm text-yellow-600">⚠ Aucun département actif pour ce cycle.</p>
                            @endif
                        </div>

                        <!-- Statut -->
                        <div>
                            <label class="block text-sm font-medium text-gray-700">Statut</label>
                            <select wire:model="status"
                                class="mt-1 block w-full rounded-lg border-gray-300 shadow-sm focus:border-indigo-500 focus:ring-indigo-500">
                                <option value="pending">En attente</option>
                                <option value="Success">Actif</option>
                                <option value="completed">Terminé</option>
                            </select>
                        </div>
                    </div>

                    <div class="mt-8 flex justify-end gap-4">
                        <button type="submit" class="px-6 py-2 bg-indigo-600 text-white rounded-lg hover:bg-indigo-700">
                            {{ $showEditModal ? 'Modifier' : 'Créer' }}
                        </button>
                        <button wire:click="closeModal" type="button" class="px-6 py-2 bg-gray-300 text-gray-800 rounded-lg hover:bg-gray-400">
                            Annuler
                        </button>
                    </div>
                </form>
            </div>
        </div>
    @endif

    <!-- Modal Détails -->
    @if ($showDetailsModal && $filiereElement)
        <div class="fixed inset-0 bg-gray-900 bg-opacity-60 flex items-center justify-center z-50">
            <div class="bg-white rounded-2xl p-8 w-full max-w-2xl max-h-[90vh] overflow-y-auto shadow-2xl">
                <h2 class="text-2xl font-bold text-gray-800 mb-6">{{ $filiereElement->name }}</h2>

                <div class="space-y-4 text-sm">
                    <p><strong>Cycle :</strong> {{ $filiereElement->departement?->cycle?->name ?? '—' }}</p>
                    <p><strong>Département :</strong> {{ $filiereElement->departement?->nom ?? 'Non rattaché' }}</p>
                    <p><strong>Description :</strong> {{ $filiereElement->description ?? '—' }}</p>
                    <p><strong>Code :</strong> {{ $filiereElement->code }}</p>
                    <p><strong>Nombre de spécialités :</strong> {{ $filiereElement->specialites->count() }}</p>
                    <p><strong>Statut :</strong>
                        @if ($filiereElement->status === 'Success')
                            <span class="text-green-600 font-medium">Actif</span>
                        @elseif ($filiereElement->status === 'pending')
                            <span class="text-yellow-600 font-medium">En attente</span>
                        @else
                            <span class="text-gray-600 font-medium">Inactif</span>
                        @endif
                    </p>
                </div>

                <div class="mt-8 flex justify-end">
                    <button wire:click="closeModal" class="px-6 py-2 bg-gray-600 text-white rounded-lg hover:bg-gray-700">
                        Fermer
                    </button>
                </div>
            </div>
        </div>
    @endif

    <!-- Modal Activer -->
    @if ($showActivateModal && $filiereElement)
        <div class="fixed inset-0 bg-gray-900 bg-opacity-60 flex items-center justify-center z-50">
            <div class="bg-white rounded-xl p-6 max-w-md w-full">
                <h3 class="text-xl font-bold mb-4">Activer la filière</h3>
                <p class="mb-6">Confirmez l'activation de <strong>{{ $filiereElement->name }}</strong> ?</p>
                <div class="flex justify-end gap-4">
                    <button wire:click="activateFiliere" class="px-5 py-2 bg-green-600 text-white rounded-lg hover:bg-green-700">Oui</button>
                    <button wire:click="closeModal" class="px-5 py-2 bg-gray-300 rounded-lg hover:bg-gray-400">Non</button>
                </div>
            </div>
        </div>
    @endif

    <!-- Modal Désactiver -->
    @if ($showDeactivateModal && $filiereElement)
        <div class="fixed inset-0 bg-gray-900 bg-opacity-60 flex items-center justify-center z-50">
            <div class="bg-white rounded-xl p-6 max-w-md w-full">
                <h3 class="text-xl font-bold mb-4">Désactiver la filière</h3>
                <p class="mb-6">Confirmez la désactivation de <strong>{{ $filiereElement->name }}</strong> ?</p>
                <div class="flex justify-end gap-4">
                    <button wire:click="deactivateFiliere" class="px-5 py-2 bg-yellow-600 text-white rounded-lg hover:bg-yellow-700">Oui</button>
                    <button wire:click="closeModal" class="px-5 py-2 bg-gray-300 rounded-lg hover:bg-gray-400">Non</button>
                </div>
            </div>
        </div>
    @endif

    <!-- Modal Supprimer -->
    @if ($showDeleteModal && $filiereElement)
        <div class="fixed inset-0 bg-gray-900 bg-opacity-60 flex items-center justify-center z-50">
            <div class="bg-white rounded-xl p-6 max-w-md w-full">
                <h3 class="text-xl font-bold text-red-600 mb-4">Supprimer la filière</h3>
                <p class="mb-6">Êtes-vous sûr de vouloir supprimer <strong>{{ $filiereElement->name }}</strong> ?</p>
                <div class="flex justify-end gap-4">
                    <button wire:click="deleteFiliere" class="px-5 py-2 bg-red-600 text-white rounded-lg hover:bg-red-700">Oui</button>
                    <button wire:click="closeModal" class="px-5 py-2 bg-gray-300 rounded-lg hover:bg-gray-400">Annuler</button>
                </div>
            </div>
        </div>
    @endif

    <!-- Liste des filières -->
    <div class="bg-white rounded-2xl shadow-lg p-8 mt-10">
        <h2 class="text-2xl font-semibold text-gray-800 mb-6">Liste des Filières</h2>

        @if (count($filieres) > 0)
            <div class="overflow-x-auto">
                <table class="w-full text-left border-separate border-spacing-y-2">
                    <thead>
                        <tr class="bg-gray-100 rounded-lg">
                            <th class="p-4 text-sm font-medium text-gray-600">Nom</th>
                            <th class="p-4 text-sm font-medium text-gray-600">Code</th>
                            <th class="p-4 text-sm font-medium text-gray-600">Cycle</th>
                            <th class="p-4 text-sm font-medium text-gray-600">Département</th>
                            <th class="p-4 text-sm font-medium text-gray-600">Spécialités</th>
                            <th class="p-4 text-sm font-medium text-gray-600">Statut</th>
                            <th class="p-4 text-sm font-medium text-gray-600">Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        @foreach ($filieres as $fil)
                            <tr class="bg-gray-50 rounded-lg hover:bg-gray-100 transition duration-200">
                                <td class="p-4 font-medium">{{ $fil->name }}</td>
                                <td class="p-4 text-gray-500">{{ $fil->code }}</td>
                                <td class="p-4">
                                    <span class="inline-block px-2 py-1 text-xs rounded-full bg-purple-100 text-purple-800">
                                        {{ $fil->departement?->cycle?->name ?? '—' }}
                                    </span>
                                </td>
                                <td class="p-4">{{ $fil->departement?->nom ?? '—' }}</td>
                                <td class="p-4 text-center">{{ $specialitesCount[$fil->id] ?? 0 }}</td>
                                <td class="p-4">
                                    @if ($fil->status === 'pending')
                                        <span class="inline-block px-3 py-1 text-xs font-medium rounded-full bg-yellow-100 text-yellow-800">En attente</span>
                                    @elseif ($fil->status === 'Success')
                                        <span class="inline-block px-3 py-1 text-xs font-medium rounded-full bg-green-100 text-green-800">Actif</span>
                                    @else
                                        <span class="inline-block px-3 py-1 text-xs font-medium rounded-full bg-gray-100 text-gray-800">Inactif</span>
                                    @endif
                                </td>
                                <td class="p-4 flex flex-wrap gap-2">
                                    <button wire:click="functionShowDetailsModal({{ $fil->id }})"
                                        class="px-3 py-1 bg-blue-600 text-white text-sm rounded hover:bg-blue-700">Détails</button>

                                    @if ($fil->status === 'pending')
                                        <button wire:click="functionShowActivateModal({{ $fil->id }})"
                                            class="px-3 py-1 bg-green-600 text-white text-sm rounded hover:bg-green-700">Activer</button>
                                    @elseif ($fil->status === 'Success')
                                        <button wire:click="functionShowDeactivateModal({{ $fil->id }})"
                                            class="px-3 py-1 bg-yellow-600 text-white text-sm rounded hover:bg-yellow-700">Désactiver</button>
                                    @endif

                                    <button wire:click="functionShowEditModal({{ $fil->id }})"
                                        class="px-3 py-1 bg-indigo-600 text-white text-sm rounded hover:bg-indigo-700">Modifier</button>

                                    <button wire:click="functionShowDeleteModal({{ $fil->id }})"
                                        class="px-3 py-1 bg-red-600 text-white text-sm rounded hover:bg-red-700">Supprimer</button>
                                </td>
                            </tr>
                        @endforeach
                    </tbody>
                </table>
            </div>
        @else
            <p class="text-center text-gray-500 py-8">Aucune filière enregistrée pour le moment.</p>
        @endif
    </div>

    <!-- Notification -->
    @if ($showNotification)
        <div class="fixed top-6 right-6 z-50 max-w-sm w-full" x-data="{ show: true }" x-show="show" x-transition
             x-init="setTimeout(() => { show = false; $wire.set('showNotification', false) }, 4000)">
            <div class="p-4 rounded-xl shadow-lg border-l-4 bg-green-50 border-green-500 text-green-800 flex items-center gap-3">
                <svg class="w-5 h-5 flex-shrink-0" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 13l4 4L19 7" />
                </svg>
                <span class="text-sm font-medium">{{ $notificationMessage }}</span>
            </div>
        </div>
    @endif
</div>
@endvolt
</x-layouts.app>