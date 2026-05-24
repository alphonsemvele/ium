<?php
use function Laravel\Folio\{name, middleware};
use Livewire\Volt\Component;
use App\Models\Cour;
use App\Models\User;
use App\Models\Filiere;
use App\Models\Specialite;
use App\Models\Ue;
use App\Models\Examen;
use Illuminate\Support\Str;

name('admin.cours-calendrier');
middleware(['auth', 'verified']);

new class extends Component {
    public $cours;
    public $filieres;
    public $specialites;
    public $ues;
    public $enseignants;

    // ── Recherche & Filtres ───────────────────────────────────────────────────
    public string $search            = '';
    public $filter_filiere_id        = null;
    public $filter_specialite_id     = null;
    public $filter_statut            = '';
    public $filter_specialites       = [];  // options pour le select filtre spécialité

    // ── Formulaire ────────────────────────────────────────────────────────────
    public $name          = '';
    public $filiere_id    = null;
    public $specialite_id = null;
    public $ue_id         = null;
    public $examen_id     = null;
    public $examenLabel   = '';
    public $responsable_id = null;
    public $credit        = 0;
    public $hour_number   = '';
    public $status        = 'pending';

    // ── Modals ────────────────────────────────────────────────────────────────
    public $showCreateModal     = false;
    public $showEditModal       = false;
    public $showDeleteModal     = false;
    public $showActivateModal   = false;
    public $showDeactivateModal = false;
    public $showDetailsModal    = false;

    public $courElement;

    public bool   $showNotification    = false;
    public string $notificationMessage = '';
    public string $notificationType    = '';
    public array  $formErrors          = [];

    public function mount()
    {
        $this->loadData();
    }

    // ── Watchers filtres ──────────────────────────────────────────────────────

    public function updatedSearch()                { $this->loadData(); }
    public function updatedFilterStatut()          { $this->loadData(); }
    public function updatedFilterSpecialiteId()    { $this->loadData(); }

    public function updatedFilterFiliereId($value)
    {
        $this->filter_specialite_id = null;
        $this->filter_specialites   = $value
            ? Specialite::where('status', 'Success')->where('filiere_id', $value)->orderBy('name')->get()
            : collect();
        $this->loadData();
    }

    public function resetFilters()
    {
        $this->search              = '';
        $this->filter_filiere_id   = null;
        $this->filter_specialite_id = null;
        $this->filter_statut       = '';
        $this->filter_specialites  = collect();
        $this->loadData();
    }

    // ── Chargement ────────────────────────────────────────────────────────────

    public function loadData()
    {
        try {
            $query = Cour::with(['filiere', 'specialite', 'responsable', 'ue', 'examen'])
                ->where('status', '!=', 'failed');

            // Recherche texte
            if (!empty($this->search)) {
                $s = $this->search;
                $query->where(function ($q) use ($s) {
                    $q->where('name', 'like', "%{$s}%")
                      ->orWhere('code', 'like', "%{$s}%")
                      ->orWhereHas('filiere',     fn($r) => $r->where('name',  'like', "%{$s}%"))
                      ->orWhereHas('specialite',  fn($r) => $r->where('name',  'like', "%{$s}%"))
                      ->orWhereHas('ue',          fn($r) => $r->where('name',  'like', "%{$s}%"))
                      ->orWhereHas('responsable', fn($r) => $r->where('name',  'like', "%{$s}%"))
                      ->orWhereHas('examen',      fn($r) => $r->where('titre', 'like', "%{$s}%"));
                });
            }

            // Filtre filière
            if ($this->filter_filiere_id) {
                $query->where('filiere_id', $this->filter_filiere_id);
            }

            // Filtre spécialité
            if ($this->filter_specialite_id) {
                $query->where('specialite_id', $this->filter_specialite_id);
            }

            // Filtre statut
            if ($this->filter_statut !== '') {
                $query->where('status', $this->filter_statut);
            }

            $this->cours = $query->orderBy('name')->get();

            $this->filieres    = Filiere::where('status', 'Success')->orderBy('name')->get();
            $this->enseignants = User::whereNotIn('role', ['student', 'etudiant', 'admin'])
                ->where('status', 'Success')
                ->orderBy('name')
                ->get();

        } catch (\Exception $e) {
            logger('Erreur loadData: ' . $e->getMessage());
            $this->cours       = collect();
            $this->filieres    = collect();
            $this->enseignants = collect();
        }
    }

    // ── Cascades formulaire ───────────────────────────────────────────────────

    public function updatedFiliereId($value)
    {
        $this->specialite_id = null;
        $this->ue_id         = null;
        $this->examen_id     = null;
        $this->examenLabel   = '';

        $this->specialites = $value
            ? Specialite::where('status', 'Success')->where('filiere_id', $value)->get()
            : collect();

        $this->ues = collect();
    }

    public function updatedSpecialiteId($value)
    {
        $this->ue_id = null;

        $this->ues = $value
            ? Ue::where('status', 'Success')->where('specialite_id', $value)->get()
            : collect();
    }

    public function updatedUeId($value)
    {
        if ($value) {
            $ue = Ue::with('examen')->find($value);
            if ($ue && $ue->examen_id) {
                $this->examen_id   = $ue->examen_id;
                $this->examenLabel = $ue->examen
                    ? $ue->examen->titre . ($ue->examen->date ? ' (' . \Carbon\Carbon::parse($ue->examen->date)->format('d/m/Y') . ')' : '')
                    : '';
            } else {
                $this->examen_id   = null;
                $this->examenLabel = '';
            }
        } else {
            $this->examen_id   = null;
            $this->examenLabel = '';
        }
    }

    private function resolveExamenId(): void
    {
        if ($this->examen_id) return;
        if ($this->ue_id) {
            $ue = Ue::find($this->ue_id);
            if ($ue?->examen_id) {
                $this->examen_id = $ue->examen_id;
            }
        }
    }

    // ── Modals ────────────────────────────────────────────────────────────────

    public function functionShowCreateModal()
    {
        $this->resetForm();
        $this->filieres        = Filiere::where('status', 'Success')->get();
        $this->showCreateModal = true;
        $this->formErrors      = [];
    }

    public function functionShowEditModal($id)
    {
        try {
            $this->courElement = Cour::with(['filiere', 'specialite', 'responsable', 'ue', 'examen'])->findOrFail($id);

            $this->name           = $this->courElement->name;
            $this->filiere_id     = $this->courElement->filiere_id;
            $this->specialite_id  = $this->courElement->specialite_id;
            $this->ue_id          = $this->courElement->ue_id;
            $this->examen_id      = $this->courElement->examen_id;
            $this->responsable_id = $this->courElement->responsable_id;
            $this->credit         = $this->courElement->credit ?? 0;
            $this->hour_number    = $this->courElement->hour_number;
            $this->status         = $this->courElement->status;

            if ($this->courElement->examen) {
                $examen = $this->courElement->examen;
                $this->examenLabel = $examen->titre . ($examen->date ? ' (' . \Carbon\Carbon::parse($examen->date)->format('d/m/Y') . ')' : '');
            } else {
                $this->examenLabel = '';
            }

            $this->filieres    = Filiere::where('status', 'Success')->get();
            $this->specialites = $this->filiere_id
                ? Specialite::where('status', 'Success')->where('filiere_id', $this->filiere_id)->get()
                : collect();
            $this->ues = $this->specialite_id
                ? Ue::where('status', 'Success')->where('specialite_id', $this->specialite_id)->get()
                : collect();

            $this->showEditModal = true;
            $this->formErrors    = [];
        } catch (\Exception $e) {
            logger('Erreur functionShowEditModal: ' . $e->getMessage());
            $this->formErrors['general'] = 'Erreur lors de l\'ouverture du modal d\'édition';
        }
    }

    public function functionShowDetailsModal($id)
    {
        try {
            $this->courElement      = Cour::with(['filiere', 'specialite', 'responsable', 'ue', 'examen'])->findOrFail($id);
            $this->showDetailsModal = true;
        } catch (\Exception $e) {
            logger('Erreur functionShowDetailsModal: ' . $e->getMessage());
        }
    }

    public function functionShowDeleteModal($id)
    {
        try {
            $this->courElement     = Cour::findOrFail($id);
            $this->showDeleteModal = true;
        } catch (\Exception $e) {
            logger('Erreur functionShowDeleteModal: ' . $e->getMessage());
        }
    }

    public function functionShowActivateModal($id)
    {
        try {
            $this->courElement       = Cour::findOrFail($id);
            $this->showActivateModal = true;
        } catch (\Exception $e) {
            logger('Erreur functionShowActivateModal: ' . $e->getMessage());
        }
    }

    public function functionShowDeactivateModal($id)
    {
        try {
            $this->courElement         = Cour::findOrFail($id);
            $this->showDeactivateModal = true;
        } catch (\Exception $e) {
            logger('Erreur functionShowDeactivateModal: ' . $e->getMessage());
        }
    }

    // ── CRUD ──────────────────────────────────────────────────────────────────

    public function save()
    {
        try {
            $rules = [
                'name'           => 'required|string|max:255',
                'filiere_id'     => 'required|exists:filieres,id',
                'specialite_id'  => count($this->specialites) > 0 ? 'required|exists:specialites,id' : 'nullable',
                'ue_id'          => count($this->ues) > 0 ? 'required|exists:ues,id' : 'nullable',
                'responsable_id' => 'nullable|exists:users,id',
                'credit'         => 'required|integer|min:0',
                'hour_number'    => 'required|integer|min:1',
                'status'         => 'required|in:pending,Success,completed',
            ];

            $validated = $this->validate($rules);
            $this->resolveExamenId();

            if (!$this->examen_id) {
                $this->formErrors['examen_id'] = ['Aucun examen trouvé pour cette UE.'];
                return;
            }

            Cour::create([
                'name'           => $validated['name'],
                'code'           => 'C-' . Str::random(6),
                'filiere_id'     => $validated['filiere_id'],
                'specialite_id'  => $validated['specialite_id'] ?? null,
                'ue_id'          => $validated['ue_id'] ?? null,
                'examen_id'      => $this->examen_id,
                'responsable_id' => !empty($validated['responsable_id']) ? $validated['responsable_id'] : null,
                'credit'         => $validated['credit'] ?? 0,
                'hour_number'    => $validated['hour_number'],
                'status'         => $validated['status'],
            ]);

            $this->resetForm();
            $this->showCreateModal = false;
            $this->loadData();
            $this->showSuccessNotification('Cours ajouté avec succès !');

        } catch (\Illuminate\Validation\ValidationException $e) {
            $this->formErrors = $e->errors();
        } catch (\Exception $e) {
            logger('Erreur save: ' . $e->getMessage());
            $this->formErrors['general'] = 'Erreur : ' . $e->getMessage();
        }
    }

    public function update()
    {
        try {
            $rules = [
                'name'           => 'required|string|max:255',
                'filiere_id'     => 'required|exists:filieres,id',
                'specialite_id'  => count($this->specialites) > 0 ? 'required|exists:specialites,id' : 'nullable',
                'ue_id'          => count($this->ues) > 0 ? 'required|exists:ues,id' : 'nullable',
                'responsable_id' => 'nullable|exists:users,id',
                'credit'         => 'required|integer|min:0',
                'hour_number'    => 'required|integer|min:1',
                'status'         => 'required|in:pending,Success,completed',
            ];

            $validated = $this->validate($rules);
            $this->resolveExamenId();

            if (!$this->examen_id) {
                $this->formErrors['examen_id'] = ['Aucun examen trouvé pour cette UE.'];
                return;
            }

            $this->courElement->update([
                'name'           => $validated['name'],
                'code'           => 'C-' . Str::random(6),
                'filiere_id'     => $validated['filiere_id'],
                'specialite_id'  => $validated['specialite_id'] ?? null,
                'ue_id'          => $validated['ue_id'] ?? null,
                'examen_id'      => $this->examen_id,
                'responsable_id' => !empty($validated['responsable_id']) ? $validated['responsable_id'] : null,
                'credit'         => $validated['credit'] ?? 0,
                'hour_number'    => $validated['hour_number'],
                'status'         => $validated['status'],
            ]);

            $this->resetForm();
            $this->showEditModal = false;
            $this->courElement   = null;
            $this->loadData();
            $this->showSuccessNotification('Cours mis à jour avec succès !');

        } catch (\Illuminate\Validation\ValidationException $e) {
            $this->formErrors = $e->errors();
        } catch (\Exception $e) {
            logger('Erreur update: ' . $e->getMessage());
            $this->formErrors['general'] = 'Erreur : ' . $e->getMessage();
        }
    }

    public function activateCour()
    {
        try {
            $this->courElement->update(['status' => 'Success']);
            $this->showActivateModal = false;
            $this->loadData();
            $this->showSuccessNotification('Cours activé !');
        } catch (\Exception $e) {
            $this->formErrors['general'] = 'Erreur lors de l\'activation';
        }
    }

    public function deactivateCour()
    {
        try {
            $this->courElement->update(['status' => 'pending']);
            $this->showDeactivateModal = false;
            $this->loadData();
            $this->showSuccessNotification('Cours désactivé !');
        } catch (\Exception $e) {
            $this->formErrors['general'] = 'Erreur lors de la désactivation';
        }
    }

    public function deleteCour()
    {
        try {
            $this->courElement->update(['status' => 'failed']);
            $this->showDeleteModal = false;
            $this->loadData();
            $this->showSuccessNotification('Cours supprimé !');
        } catch (\Exception $e) {
            $this->formErrors['general'] = 'Erreur lors de la suppression';
        }
    }

    public function clearSearch()
    {
        $this->search = '';
        $this->loadData();
    }

    public function closeModal()
    {
        $this->showCreateModal     = false;
        $this->showEditModal       = false;
        $this->showDeleteModal     = false;
        $this->showActivateModal   = false;
        $this->showDeactivateModal = false;
        $this->showDetailsModal    = false;
        $this->courElement         = null;
        $this->resetForm();
    }

    private function resetForm()
    {
        $this->name           = '';
        $this->filiere_id     = null;
        $this->specialite_id  = null;
        $this->ue_id          = null;
        $this->examen_id      = null;
        $this->examenLabel    = '';
        $this->responsable_id = null;
        $this->credit         = 0;
        $this->hour_number    = '';
        $this->status         = 'pending';
        $this->formErrors     = [];
        $this->specialites    = collect();
        $this->ues            = collect();
    }

    private function showSuccessNotification($message)
    {
        $this->notificationMessage = $message;
        $this->notificationType    = 'success';
        $this->showNotification    = true;
    }

    // Compte les filtres actifs pour le badge
    public function getActiveFiltersCountProperty(): int
    {
        return (int)(!empty($this->search))
             + (int)(!empty($this->filter_filiere_id))
             + (int)(!empty($this->filter_specialite_id))
             + (int)($this->filter_statut !== '');
    }
};
?>

<x-layouts.app header="true">
@volt
<div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-12">

    {{-- ─── Header ─── --}}
    <header class="mb-12 text-center">
        <h1 class="text-4xl font-bold text-gray-900 bg-gradient-to-r from-indigo-600 to-purple-600 bg-clip-text text-transparent tracking-tight">
            Gestion des Cours et Calendrier
        </h1>
        <p class="mt-3 text-lg text-gray-600">Configurez les cours, le calendrier et affectez un enseignant.</p>
        <button wire:click="functionShowCreateModal"
            class="mt-6 bg-indigo-600 text-white py-3 px-8 rounded-xl hover:bg-indigo-700 transition duration-300 shadow-lg">
            Ajouter un cours
        </button>
    </header>

    @if (!empty($formErrors['general']))
        <div class="mb-4 p-4 bg-red-100 text-red-700 rounded-lg border-l-4 border-red-500">
            {{ $formErrors['general'] }}
        </div>
    @endif

    {{-- ════════════════════════════════════════════
         MODAL : CRÉER
    ════════════════════════════════════════════ --}}
    @if ($showCreateModal)
        <div class="fixed inset-0 bg-gray-900 bg-opacity-60 flex items-center justify-center z-50">
            <div class="bg-white rounded-2xl p-8 w-full max-w-xl max-h-[90vh] overflow-y-auto shadow-2xl">
                <h2 class="text-2xl font-semibold text-gray-800 mb-6">Ajouter un Cours</h2>

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
                    <div class="grid grid-cols-1 md:grid-cols-2 gap-6">

                        <div>
                            <label class="block text-sm font-medium text-gray-600">Filière *</label>
                            <select wire:model.live="filiere_id" required
                                class="mt-1 w-full p-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-indigo-500">
                                <option value="">Sélectionner une filière</option>
                                @foreach ($filieres as $filiere)
                                    <option value="{{ $filiere->id }}">{{ $filiere->name }}</option>
                                @endforeach
                            </select>
                        </div>

                        <div>
                            <label class="block text-sm font-medium text-gray-600">Spécialité</label>
                            <select wire:model.live="specialite_id"
                                class="mt-1 w-full p-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-indigo-500">
                                <option value="">— Optionnel —</option>
                                @foreach ($specialites as $sp)
                                    <option value="{{ $sp->id }}">{{ $sp->name }}</option>
                                @endforeach
                            </select>
                        </div>

                        <div class="md:col-span-2">
                            <label class="block text-sm font-medium text-gray-600">Unité d'Enseignement</label>
                            <select wire:model.live="ue_id"
                                class="mt-1 w-full p-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-indigo-500">
                                <option value="">— Optionnel —</option>
                                @foreach ($ues as $ue)
                                    <option value="{{ $ue->id }}">{{ $ue->name }} ({{ $ue->credits }} crédits)</option>
                                @endforeach
                            </select>
                        </div>

                        <div class="md:col-span-2">
                            <label class="block text-sm font-medium text-gray-600">
                                Examen lié
                                <span class="text-xs text-gray-400 font-normal">(automatique depuis l'UE)</span>
                            </label>
                            @if ($examen_id && $examenLabel)
                                <div class="mt-1 w-full p-3 bg-purple-50 border border-purple-200 rounded-lg flex items-center gap-2">
                                    <svg class="w-4 h-4 text-purple-600 flex-shrink-0" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12h6m-6 4h6m2 5H7a2 2 0 01-2-2V5a2 2 0 012-2h5.586a1 1 0 01.707.293l5.414 5.414a1 1 0 01.293.707V19a2 2 0 01-2 2z"/>
                                    </svg>
                                    <span class="text-purple-700 text-sm font-medium">{{ $examenLabel }}</span>
                                </div>
                            @else
                                <div class="mt-1 w-full p-3 bg-yellow-50 border border-yellow-200 rounded-lg text-yellow-700 text-sm">
                                    ⚠️ Aucun examen trouvé — sélectionnez une UE avec un examen associé.
                                </div>
                            @endif
                        </div>

                        <div class="md:col-span-2">
                            <label class="block text-sm font-medium text-gray-600">Enseignant responsable</label>
                            <select wire:model="responsable_id"
                                class="mt-1 w-full p-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-indigo-500">
                                <option value="">Choisir un enseignant</option>
                                @foreach ($enseignants as $ens)
                                    <option value="{{ $ens->id }}">{{ $ens->name }} ({{ $ens->email }})</option>
                                @endforeach
                            </select>
                        </div>

                        <div>
                            <label class="block text-sm font-medium text-gray-600">Nom du cours *</label>
                            <input wire:model="name" type="text" required
                                class="mt-1 w-full p-3 border border-gray-300 rounded-lg">
                            @if (isset($formErrors['name']))
                                <span class="text-red-500 text-sm">{{ is_array($formErrors['name']) ? $formErrors['name'][0] : $formErrors['name'] }}</span>
                            @endif
                        </div>

                        <div>
                            <label class="block text-sm font-medium text-gray-600">Crédits du cours *</label>
                            <input wire:model="credit" type="number" required min="0" step="1"
                                class="mt-1 w-full p-3 border border-gray-300 rounded-lg">
                            @if (isset($formErrors['credit']))
                                <span class="text-red-500 text-sm">{{ is_array($formErrors['credit']) ? $formErrors['credit'][0] : $formErrors['credit'] }}</span>
                            @endif
                        </div>

                        <div>
                            <label class="block text-sm font-medium text-gray-600">Nombre d'heures *</label>
                            <input wire:model="hour_number" type="number" required min="1" step="1"
                                class="mt-1 w-full p-3 border border-gray-300 rounded-lg">
                            @if (isset($formErrors['hour_number']))
                                <span class="text-red-500 text-sm">{{ is_array($formErrors['hour_number']) ? $formErrors['hour_number'][0] : $formErrors['hour_number'] }}</span>
                            @endif
                        </div>

                        <div>
                            <label class="block text-sm font-medium text-gray-600">Statut *</label>
                            <select wire:model="status" required
                                class="mt-1 w-full p-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-indigo-500">
                                <option value="pending">En attente</option>
                                <option value="Success">Actif</option>
                                <option value="completed">Terminé</option>
                            </select>
                        </div>

                    </div>

                    <div class="mt-8 flex justify-end space-x-4">
                        <button type="submit"
                            class="bg-indigo-600 text-white py-3 px-6 rounded-xl hover:bg-indigo-700">
                            Enregistrer
                        </button>
                        <button wire:click="closeModal" type="button"
                            class="bg-gray-500 text-white py-3 px-6 rounded-xl hover:bg-gray-600">
                            Annuler
                        </button>
                    </div>
                </form>
            </div>
        </div>
    @endif

    {{-- ════════════════════════════════════════════
         MODAL : MODIFIER
    ════════════════════════════════════════════ --}}
    @if ($showEditModal && $courElement)
        <div class="fixed inset-0 bg-gray-900 bg-opacity-60 flex items-center justify-center z-50">
            <div class="bg-white rounded-2xl p-8 w-full max-w-xl max-h-[90vh] overflow-y-auto shadow-2xl">
                <h2 class="text-2xl font-semibold text-gray-800 mb-6">Modifier le cours</h2>

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
                    <div class="grid grid-cols-1 md:grid-cols-2 gap-6">

                        <div>
                            <label class="block text-sm font-medium text-gray-600">Filière *</label>
                            <select wire:model.live="filiere_id" required
                                class="mt-1 w-full p-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-indigo-500">
                                <option value="">Sélectionner une filière</option>
                                @foreach ($filieres as $filiere)
                                    <option value="{{ $filiere->id }}" @selected($filiere->id == $filiere_id)>{{ $filiere->name }}</option>
                                @endforeach
                            </select>
                        </div>

                        <div>
                            <label class="block text-sm font-medium text-gray-600">Spécialité</label>
                            <select wire:model.live="specialite_id"
                                class="mt-1 w-full p-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-indigo-500">
                                <option value="">— Optionnel —</option>
                                @foreach ($specialites as $sp)
                                    <option value="{{ $sp->id }}" @selected($sp->id == $specialite_id)>{{ $sp->name }}</option>
                                @endforeach
                            </select>
                        </div>

                        <div class="md:col-span-2">
                            <label class="block text-sm font-medium text-gray-600">Unité d'Enseignement</label>
                            <select wire:model.live="ue_id"
                                class="mt-1 w-full p-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-indigo-500">
                                <option value="">— Optionnel —</option>
                                @foreach ($ues as $ue)
                                    <option value="{{ $ue->id }}" @selected($ue->id == $ue_id)>{{ $ue->name }} ({{ $ue->credits }} crédits)</option>
                                @endforeach
                            </select>
                        </div>

                        <div class="md:col-span-2">
                            <label class="block text-sm font-medium text-gray-600">
                                Examen lié
                                <span class="text-xs text-gray-400 font-normal">(automatique depuis l'UE)</span>
                            </label>
                            @if ($examen_id && $examenLabel)
                                <div class="mt-1 w-full p-3 bg-purple-50 border border-purple-200 rounded-lg flex items-center gap-2">
                                    <svg class="w-4 h-4 text-purple-600 flex-shrink-0" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12h6m-6 4h6m2 5H7a2 2 0 01-2-2V5a2 2 0 012-2h5.586a1 1 0 01.707.293l5.414 5.414a1 1 0 01.293.707V19a2 2 0 01-2 2z"/>
                                    </svg>
                                    <span class="text-purple-700 text-sm font-medium">{{ $examenLabel }}</span>
                                </div>
                            @else
                                <div class="mt-1 w-full p-3 bg-yellow-50 border border-yellow-200 rounded-lg text-yellow-700 text-sm">
                                    ⚠️ Aucun examen trouvé — sélectionnez une UE avec un examen associé.
                                </div>
                            @endif
                        </div>

                        <div>
                            <label class="block text-sm font-medium text-gray-600">Nom du cours *</label>
                            <input wire:model="name" type="text" required
                                class="mt-1 w-full p-3 border border-gray-300 rounded-lg">
                            @if (isset($formErrors['name']))
                                <span class="text-red-500 text-sm">{{ is_array($formErrors['name']) ? $formErrors['name'][0] : $formErrors['name'] }}</span>
                            @endif
                        </div>

                        <div>
                            <label class="block text-sm font-medium text-gray-600">Enseignant responsable</label>
                            <select wire:model="responsable_id"
                                class="mt-1 w-full p-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-indigo-500">
                                <option value="">Choisir un enseignant</option>
                                @foreach ($enseignants as $ens)
                                    <option value="{{ $ens->id }}" @selected($ens->id == $responsable_id)>{{ $ens->name }} ({{ $ens->email }})</option>
                                @endforeach
                            </select>
                        </div>

                        <div>
                            <label class="block text-sm font-medium text-gray-600">Crédits du cours *</label>
                            <input wire:model="credit" type="number" required min="0" step="1"
                                class="mt-1 w-full p-3 border border-gray-300 rounded-lg">
                        </div>

                        <div>
                            <label class="block text-sm font-medium text-gray-600">Nombre d'heures *</label>
                            <input wire:model="hour_number" type="number" required min="1" step="1"
                                class="mt-1 w-full p-3 border border-gray-300 rounded-lg">
                        </div>

                        <div>
                            <label class="block text-sm font-medium text-gray-600">Statut *</label>
                            <select wire:model="status" required
                                class="mt-1 w-full p-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-indigo-500">
                                <option value="pending"   @selected($status === 'pending')>En attente</option>
                                <option value="Success"   @selected($status === 'Success')>Actif</option>
                                <option value="completed" @selected($status === 'completed')>Terminé</option>
                            </select>
                        </div>
                    </div>

                    <div class="mt-8 flex justify-end space-x-4">
                        <button type="submit"
                            class="bg-indigo-600 text-white py-3 px-6 rounded-xl hover:bg-indigo-700">
                            Mettre à jour
                        </button>
                        <button wire:click="closeModal" type="button"
                            class="bg-gray-500 text-white py-3 px-6 rounded-xl hover:bg-gray-600">
                            Annuler
                        </button>
                    </div>
                </form>
            </div>
        </div>
    @endif

    {{-- ════════════════════════════════════════════
         MODAL : DÉTAILS
    ════════════════════════════════════════════ --}}
    @if ($showDetailsModal && $courElement)
        <div class="fixed inset-0 bg-gray-900 bg-opacity-60 flex items-center justify-center z-50">
            <div class="bg-white rounded-2xl p-8 w-full max-w-3xl max-h-[90vh] overflow-y-auto shadow-2xl">
                <h2 class="text-2xl font-semibold text-gray-800 mb-6">Détails du Cours</h2>
                <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
                    <div><label class="block text-sm font-medium text-gray-600">Nom du Cours</label><p class="mt-1 text-gray-800">{{ $courElement->name ?? 'N/A' }}</p></div>
                    <div><label class="block text-sm font-medium text-gray-600">Code</label><p class="mt-1 text-gray-800">{{ $courElement->code ?? 'N/A' }}</p></div>
                    <div><label class="block text-sm font-medium text-gray-600">Filière</label><p class="mt-1 text-gray-800">{{ $courElement->filiere->name ?? 'N/A' }}</p></div>
                    <div><label class="block text-sm font-medium text-gray-600">Spécialité</label><p class="mt-1 text-gray-800">{{ $courElement->specialite->name ?? 'N/A' }}</p></div>
                    <div><label class="block text-sm font-medium text-gray-600">Unité d'Enseignement</label><p class="mt-1 text-gray-800">{{ $courElement->ue->name ?? 'N/A' }}</p></div>
                    <div>
                        <label class="block text-sm font-medium text-gray-600">Examen lié</label>
                        @if ($courElement->examen)
                            <span class="inline-flex items-center gap-1 mt-1 text-xs bg-purple-50 text-purple-700 px-2 py-1 rounded-full font-medium">
                                {{ $courElement->examen->titre }}
                                @if ($courElement->examen->date)
                                    ({{ \Carbon\Carbon::parse($courElement->examen->date)->format('d/m/Y') }})
                                @endif
                            </span>
                        @else
                            <p class="mt-1 text-gray-400">—</p>
                        @endif
                    </div>
                    <div><label class="block text-sm font-medium text-gray-600">Enseignant</label><p class="mt-1 text-gray-800">{{ $courElement->responsable->name ?? 'N/A' }}</p></div>
                    <div><label class="block text-sm font-medium text-gray-600">Crédits</label><p class="mt-1 text-gray-800">{{ $courElement->credit ?? 0 }}</p></div>
                    <div><label class="block text-sm font-medium text-gray-600">Nombre d'heures</label><p class="mt-1 text-gray-800">{{ $courElement->hour_number ?? 'N/A' }}</p></div>
                    <div>
                        <label class="block text-sm font-medium text-gray-600">Statut</label>
                        <p class="mt-1">
                            @if ($courElement->status === 'pending')    <span class="text-yellow-600">En attente</span>
                            @elseif ($courElement->status === 'Success') <span class="text-green-600">Actif</span>
                            @else                                        <span class="text-gray-600">Terminé</span>
                            @endif
                        </p>
                    </div>
                </div>
                <div class="mt-8 flex justify-end">
                    <button wire:click="closeModal" class="bg-gray-500 text-white py-3 px-6 rounded-xl hover:bg-gray-600">Fermer</button>
                </div>
            </div>
        </div>
    @endif

    {{-- Modals Activer / Désactiver / Supprimer --}}
    @if ($showActivateModal && $courElement)
        <div class="fixed inset-0 bg-gray-900 bg-opacity-60 flex items-center justify-center z-50">
            <div class="bg-white rounded-2xl p-6 w-full max-w-md shadow-2xl">
                <h3 class="text-xl font-semibold text-gray-800 mb-4">Activer le cours</h3>
                <p class="mb-6 text-gray-600">Voulez-vous activer "{{ $courElement->name }}" ?</p>
                <div class="flex justify-end space-x-4">
                    <button wire:click="activateCour" class="bg-green-600 text-white py-2 px-4 rounded-xl hover:bg-green-700">Oui</button>
                    <button wire:click="closeModal"   class="bg-gray-500 text-white py-2 px-4 rounded-xl hover:bg-gray-600">Annuler</button>
                </div>
            </div>
        </div>
    @endif

    @if ($showDeactivateModal && $courElement)
        <div class="fixed inset-0 bg-gray-900 bg-opacity-60 flex items-center justify-center z-50">
            <div class="bg-white rounded-2xl p-6 w-full max-w-md shadow-2xl">
                <h3 class="text-xl font-semibold text-gray-800 mb-4">Désactiver le cours</h3>
                <p class="mb-6 text-gray-600">Voulez-vous désactiver "{{ $courElement->name }}" ?</p>
                <div class="flex justify-end space-x-4">
                    <button wire:click="deactivateCour" class="bg-yellow-600 text-white py-2 px-4 rounded-xl hover:bg-yellow-700">Oui</button>
                    <button wire:click="closeModal"     class="bg-gray-500 text-white py-2 px-4 rounded-xl hover:bg-gray-600">Annuler</button>
                </div>
            </div>
        </div>
    @endif

    @if ($showDeleteModal && $courElement)
        <div class="fixed inset-0 bg-gray-900 bg-opacity-60 flex items-center justify-center z-50">
            <div class="bg-white rounded-2xl p-6 w-full max-w-md shadow-2xl">
                <h3 class="text-xl font-semibold text-gray-800 mb-4">Supprimer le cours</h3>
                <p class="mb-6 text-gray-600">Voulez-vous supprimer "{{ $courElement->name }}" ? Cette action est irréversible.</p>
                <div class="flex justify-end space-x-4">
                    <button wire:click="deleteCour" class="bg-red-600 text-white py-2 px-4 rounded-xl hover:bg-red-700">Oui</button>
                    <button wire:click="closeModal" class="bg-gray-500 text-white py-2 px-4 rounded-xl hover:bg-gray-600">Annuler</button>
                </div>
            </div>
        </div>
    @endif

    {{-- ════════════════════════════════════════════
         LISTE DES COURS
    ════════════════════════════════════════════ --}}
    <div class="bg-white rounded-2xl shadow-lg p-8 mt-10">

        <div class="flex flex-col sm:flex-row sm:items-center sm:justify-between gap-4 mb-6">
            <div class="flex items-center gap-3">
                <h2 class="text-2xl font-semibold text-gray-800">Liste des Cours</h2>
                <span class="bg-indigo-100 text-indigo-700 text-sm font-semibold px-3 py-0.5 rounded-full">
                    {{ count($cours) }}
                </span>
            </div>

            {{-- Recherche --}}
            <div class="relative w-full sm:w-72">
                <div class="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
                    <svg class="w-4 h-4 text-gray-400" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M21 21l-4.35-4.35M17 11A6 6 0 1 0 5 11a6 6 0 0 0 12 0z"/>
                    </svg>
                </div>
                <input wire:model.live.debounce.300ms="search" type="text"
                    placeholder="Rechercher…"
                    class="w-full pl-9 pr-9 py-2 border border-gray-300 rounded-xl text-sm focus:outline-none focus:ring-2 focus:ring-indigo-500 transition"/>
                @if ($search)
                    <button wire:click="clearSearch"
                        class="absolute inset-y-0 right-0 pr-3 flex items-center text-gray-400 hover:text-gray-600">
                        <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12"/>
                        </svg>
                    </button>
                @endif
            </div>
        </div>

        {{-- ── Barre de filtres ── --}}
        <div class="bg-gray-50 border border-gray-200 rounded-xl p-4 mb-6">
            <div class="flex flex-wrap items-end gap-3">

                {{-- Icône filtre --}}
                <div class="flex items-center gap-2 text-sm font-medium text-gray-600 mr-1">
                    <svg class="w-4 h-4 text-indigo-500" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                              d="M3 4a1 1 0 011-1h16a1 1 0 011 1v2a1 1 0 01-.293.707L13 13.414V19a1 1 0 01-.553.894l-4 2A1 1 0 017 21v-7.586L3.293 6.707A1 1 0 013 6V4z"/>
                    </svg>
                    Filtres
                    @if ($this->activeFiltersCount > 0)
                        <span class="bg-indigo-600 text-white text-xs font-bold px-2 py-0.5 rounded-full">
                            {{ $this->activeFiltersCount }}
                        </span>
                    @endif
                </div>

                {{-- Filtre Filière --}}
                <div class="flex flex-col gap-1 min-w-[160px]">
                    <label class="text-xs font-medium text-gray-500">Filière</label>
                    <select wire:model.live="filter_filiere_id"
                        class="px-3 py-2 text-sm border border-gray-300 rounded-lg bg-white focus:ring-2 focus:ring-indigo-500">
                        <option value="">Toutes les filières</option>
                        @foreach ($filieres as $filiere)
                            <option value="{{ $filiere->id }}">{{ $filiere->name }}</option>
                        @endforeach
                    </select>
                </div>

                {{-- Filtre Spécialité (dépend de la filière filtre) --}}
                <div class="flex flex-col gap-1 min-w-[160px]">
                    <label class="text-xs font-medium text-gray-500">Spécialité</label>
                    <select wire:model.live="filter_specialite_id"
                        class="px-3 py-2 text-sm border border-gray-300 rounded-lg bg-white focus:ring-2 focus:ring-indigo-500
                               {{ !$filter_filiere_id ? 'opacity-50 cursor-not-allowed' : '' }}"
                        @disabled(!$filter_filiere_id)>
                        <option value="">Toutes les spécialités</option>
                        @foreach ($filter_specialites as $sp)
                            <option value="{{ $sp->id }}">{{ $sp->name }}</option>
                        @endforeach
                    </select>
                </div>

                {{-- Filtre Statut --}}
                <div class="flex flex-col gap-1 min-w-[140px]">
                    <label class="text-xs font-medium text-gray-500">Statut</label>
                    <select wire:model.live="filter_statut"
                        class="px-3 py-2 text-sm border border-gray-300 rounded-lg bg-white focus:ring-2 focus:ring-indigo-500">
                        <option value="">Tous les statuts</option>
                        <option value="pending">En attente</option>
                        <option value="Success">Actif</option>
                        <option value="completed">Terminé</option>
                    </select>
                </div>

                {{-- Bouton reset --}}
                @if ($this->activeFiltersCount > 0)
                    <button wire:click="resetFilters"
                        class="flex items-center gap-1.5 px-3 py-2 text-sm font-medium text-red-600 bg-red-50 border border-red-200 rounded-lg hover:bg-red-100 transition self-end">
                        <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12"/>
                        </svg>
                        Réinitialiser
                    </button>
                @endif
            </div>

            {{-- Résumé des filtres actifs --}}
            @if ($this->activeFiltersCount > 0)
                <div class="flex flex-wrap gap-2 mt-3 pt-3 border-t border-gray-200">
                    @if ($search)
                        <span class="inline-flex items-center gap-1 px-2 py-1 bg-indigo-100 text-indigo-700 text-xs rounded-full font-medium">
                            Recherche : "{{ $search }}"
                            <button wire:click="clearSearch" class="ml-1 hover:text-indigo-900">×</button>
                        </span>
                    @endif
                    @if ($filter_filiere_id)
                        @php $fLabel = $filieres->firstWhere('id', $filter_filiere_id)?->name ?? ''; @endphp
                        <span class="inline-flex items-center gap-1 px-2 py-1 bg-indigo-100 text-indigo-700 text-xs rounded-full font-medium">
                            Filière : {{ $fLabel }}
                            <button wire:click="$set('filter_filiere_id', null)" class="ml-1 hover:text-indigo-900">×</button>
                        </span>
                    @endif
                    @if ($filter_specialite_id)
                        @php $sLabel = $filter_specialites->firstWhere('id', $filter_specialite_id)?->name ?? ''; @endphp
                        <span class="inline-flex items-center gap-1 px-2 py-1 bg-indigo-100 text-indigo-700 text-xs rounded-full font-medium">
                            Spécialité : {{ $sLabel }}
                            <button wire:click="$set('filter_specialite_id', null)" class="ml-1 hover:text-indigo-900">×</button>
                        </span>
                    @endif
                    @if ($filter_statut !== '')
                        @php $stLabel = ['pending'=>'En attente','Success'=>'Actif','completed'=>'Terminé'][$filter_statut] ?? $filter_statut; @endphp
                        <span class="inline-flex items-center gap-1 px-2 py-1 bg-indigo-100 text-indigo-700 text-xs rounded-full font-medium">
                            Statut : {{ $stLabel }}
                            <button wire:click="$set('filter_statut', '')" class="ml-1 hover:text-indigo-900">×</button>
                        </span>
                    @endif
                </div>
            @endif
        </div>

        {{-- ── Tableau ── --}}
        @if (count($cours) > 0)
            <div class="overflow-x-auto">
                <table class="w-full text-left border-separate border-spacing-y-2">
                    <thead>
                        <tr class="bg-gray-100 rounded-lg">
                            <th class="p-4 text-sm font-medium text-gray-600">Cours</th>
                            <th class="p-4 text-sm font-medium text-gray-600">Filière</th>
                            <th class="p-4 text-sm font-medium text-gray-600">Spécialité</th>
                            <th class="p-4 text-sm font-medium text-gray-600">UE</th>
                            <th class="p-4 text-sm font-medium text-gray-600">Examen lié</th>
                            <th class="p-4 text-sm font-medium text-gray-600">Crédits</th>
                            <th class="p-4 text-sm font-medium text-gray-600">Enseignant</th>
                            <th class="p-4 text-sm font-medium text-gray-600">Statut</th>
                            <th class="p-4 text-sm font-medium text-gray-600">Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        @foreach ($cours as $cour)
                            <tr wire:key="{{ $cour->id }}" class="bg-gray-50 rounded-lg hover:bg-indigo-50 transition duration-200">
                                <td class="p-4 font-medium text-gray-800">{{ $cour->name }}</td>
                                <td class="p-4 text-gray-600">{{ $cour->filiere->name ?? '—' }}</td>
                                <td class="p-4 text-gray-600">{{ $cour->specialite->name ?? '—' }}</td>
                                <td class="p-4 text-gray-600">{{ $cour->ue->name ?? '—' }}</td>
                                <td class="p-4">
                                    @if ($cour->examen)
                                        <span class="inline-flex items-center gap-1 text-xs bg-purple-50 text-purple-700 px-2 py-1 rounded-full font-medium">
                                            <svg class="w-3 h-3" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12h6m-6 4h6m2 5H7a2 2 0 01-2-2V5a2 2 0 012-2h5.586a1 1 0 01.707.293l5.414 5.414a1 1 0 01.293.707V19a2 2 0 01-2 2z"/>
                                            </svg>
                                            {{ $cour->examen->titre }}
                                        </span>
                                    @else
                                        <span class="text-gray-400">—</span>
                                    @endif
                                </td>
                                <td class="p-4">{{ $cour->credit ?? 0 }} cr.</td>
                                <td class="p-4 text-gray-600">{{ $cour->responsable->name ?? '—' }}</td>
                                <td class="p-4">
                                    @if ($cour->status === 'pending')
                                        <span class="inline-block px-2 py-1 text-xs font-medium rounded-full bg-yellow-100 text-yellow-800">En attente</span>
                                    @elseif ($cour->status === 'Success')
                                        <span class="inline-block px-2 py-1 text-xs font-medium rounded-full bg-green-100 text-green-800">Actif</span>
                                    @else
                                        <span class="inline-block px-2 py-1 text-xs font-medium rounded-full bg-gray-100 text-gray-800">Terminé</span>
                                    @endif
                                </td>
                                <td class="p-4">
                                    <div class="flex flex-wrap gap-1">
                                        <button wire:click="functionShowDetailsModal({{ $cour->id }})"
                                            class="px-2 py-1 bg-blue-600 text-white text-xs rounded hover:bg-blue-700">Détails</button>
                                        @if ($cour->status === 'pending')
                                            <button wire:click="functionShowActivateModal({{ $cour->id }})"
                                                class="px-2 py-1 bg-green-600 text-white text-xs rounded hover:bg-green-700">Activer</button>
                                        @elseif ($cour->status === 'Success')
                                            <button wire:click="functionShowDeactivateModal({{ $cour->id }})"
                                                class="px-2 py-1 bg-yellow-600 text-white text-xs rounded hover:bg-yellow-700">Désactiver</button>
                                        @endif
                                        <button wire:click="functionShowEditModal({{ $cour->id }})"
                                            class="px-2 py-1 bg-indigo-600 text-white text-xs rounded hover:bg-indigo-700">Modifier</button>
                                        <button wire:click="functionShowDeleteModal({{ $cour->id }})"
                                            class="px-2 py-1 bg-red-600 text-white text-xs rounded hover:bg-red-700">Supprimer</button>
                                    </div>
                                </td>
                            </tr>
                        @endforeach
                    </tbody>
                </table>
            </div>
        @else
            <div class="text-center py-12">
                <svg class="mx-auto w-12 h-12 text-gray-300 mb-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="1.5"
                          d="M9.172 16.172a4 4 0 015.656 0M9 10h.01M15 10h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z"/>
                </svg>
                <p class="text-gray-500 font-medium">Aucun cours ne correspond à vos critères.</p>
                @if ($this->activeFiltersCount > 0)
                    <button wire:click="resetFilters" class="mt-3 text-indigo-600 hover:underline text-sm">
                        Réinitialiser les filtres
                    </button>
                @endif
            </div>
        @endif
    </div>

    {{-- ── Notification toast ── --}}
    @if ($showNotification)
        <div class="fixed top-6 right-6 z-50 max-w-sm w-full"
             x-data="{ show: true }"
             x-show="show"
             x-init="setTimeout(() => { show = false; $wire.set('showNotification', false) }, 4000)"
             x-transition>
            <div class="p-4 rounded-xl shadow-lg border-l-4 bg-green-50 border-green-500 text-green-800">
                {{ $notificationMessage }}
            </div>
        </div>
    @endif

</div>
@endvolt
</x-layouts.app>