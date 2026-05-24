<?php
use function Laravel\Folio\{name, middleware};
use Livewire\Volt\Component;
use App\Models\User;
use App\Models\Cycle;
use App\Models\Filiere;
use App\Models\Specialite;

name('admin.personnel');
middleware(['auth', 'verified']);
?>

<?php

new class extends Component {
    public $users;
    public $cycles;
    public $filieres;
    public $specialites;
    public $name = '';
    public $role = '';
    public $cycle_id = '';
    public $filiere_id = '';
    public $specialite_id = '';
    public $email = '';
    public $contact = '';
    public $showAddModal = false;
    public $showEditModal = false;
    public $showDeleteModal = false;
    public $showDetailsModal = false;
    public $showActivateModal = false;
    public $showDeactivateModal = false;
    public $userElement;
    public $showNotification = false;
    public $notificationMessage = '';
    public $notificationType = '';

    public function mount()
    {
        $this->cycles = Cycle::all();
        $this->filieres = Filiere::all();
        $this->specialites = Specialite::all();
        $this->users = User::with(['cycle', 'filiere', 'specialite'])->where('role', '!=', 'student')->where('status', '!=', 'failed')->get();
    }

    public function save()
    {
        $this->validate([
            'name' => 'required|string|max:255',
            'role' => 'required|in:enseignant,filiere,specialite,concierge,bibliothecaire,admin',
            'cycle_id' => 'nullable|exists:cycles,id',
            'filiere_id' => 'required_if:role,filiere,specialite,enseignant|exists:filieres,id',
            'specialite_id' => 'nullable|exists:specialites,id',
            'email' => 'required|email|unique:users,email',
            'contact' => 'required|string|max:20',
        ]);

        User::create([
            'name' => $this->name,
            'role' => $this->role,
            'cycle_id' => $this->cycle_id ?: null,
            'filiere_id' => in_array($this->role, ['filiere', 'specialite', 'enseignant']) ? $this->filiere_id : null,
            'specialite_id' => in_array($this->role, ['specialite', 'enseignant']) && $this->specialite_id ? $this->specialite_id : null,
            'email' => $this->email,
            'contact' => $this->contact,
            'status' => 'pending',
            'password' => bcrypt('password'),
        ]);

        $this->reset(['name', 'role', 'cycle_id', 'filiere_id', 'specialite_id', 'email', 'contact']);
        $this->showAddModal = false;
        $this->users = User::with(['cycle', 'filiere', 'specialite'])->where('role', '!=', 'student')->where('status', '!=', 'failed')->get();
        $this->showNotification = true;
        $this->notificationMessage = 'Personnel ajouté avec succès !';
        $this->notificationType = 'success';
        $this->dispatch('auto-hide-notification');
    }

    public function functionShowAddModal()
    {
        $this->reset(['name', 'role', 'cycle_id', 'filiere_id', 'specialite_id', 'email', 'contact']);
        $this->showAddModal = true;
    }

    public function functionShowEditModal($id)
    {
        $this->userElement = User::with(['cycle', 'filiere', 'specialite'])->findOrFail($id);
        $this->name = $this->userElement->name;
        $this->role = $this->userElement->role;
        $this->cycle_id = $this->userElement->cycle_id;
        $this->filiere_id = $this->userElement->filiere_id;
        $this->specialite_id = $this->userElement->specialite_id;
        $this->email = $this->userElement->email;
        $this->contact = $this->userElement->contact;
        $this->showEditModal = true;
    }

    public function update()
    {
        $this->validate([
            'name' => 'required|string|max:255',
            'role' => 'required|in:enseignant,filiere,specialite,concierge,bibliothecaire,admin',
            'cycle_id' => 'nullable|exists:cycles,id',
            'filiere_id' => 'required_if:role,filiere,specialite,enseignant|exists:filieres,id',
            'specialite_id' => 'nullable|exists:specialites,id',
            'email' => 'required|email|unique:users,email,' . $this->userElement->id,
            'contact' => 'required|string|max:20',
        ]);

        $this->userElement->update([
            'name' => $this->name,
            'role' => $this->role,
            'cycle_id' => $this->cycle_id ?: null,
            'filiere_id' => in_array($this->role, ['filiere', 'specialite', 'enseignant']) ? $this->filiere_id : null,
            'specialite_id' => in_array($this->role, ['specialite', 'enseignant']) && $this->specialite_id ? $this->specialite_id : null,
            'email' => $this->email,
            'contact' => $this->contact,
        ]);

        $this->reset(['name', 'role', 'cycle_id', 'filiere_id', 'specialite_id', 'email', 'contact']);
        $this->showEditModal = false;
        $this->users = User::with(['cycle', 'filiere', 'specialite'])->where('role', '!=', 'student')->where('status', '!=', 'failed')->get();
        $this->showNotification = true;
        $this->notificationMessage = 'Personnel mis à jour avec succès !';
        $this->notificationType = 'success';
        $this->dispatch('auto-hide-notification');
    }

    public function functionShowDeleteModal($id)
    {
        $this->userElement = User::findOrFail($id);
        $this->showDeleteModal = true;
    }

    public function functionShowDetailsModal($id)
    {
        $this->userElement = User::with(['cycle', 'filiere', 'specialite'])->findOrFail($id);
        $this->showDetailsModal = true;
    }

    public function functionShowActivateModal($id)
    {
        $this->userElement = User::findOrFail($id);
        $this->showActivateModal = true;
    }

    public function functionShowDeactivateModal($id)
    {
        $this->userElement = User::findOrFail($id);
        $this->showDeactivateModal = true;
    }

    public function activateUser()
    {
        $this->userElement->update(['status' => 'Success']);
        $this->showActivateModal = false;
        $this->users = User::with(['cycle', 'filiere', 'specialite'])->where('role', '!=', 'student')->where('status', '!=', 'failed')->get();
        $this->showNotification = true;
        $this->notificationMessage = 'Personnel activé avec succès !';
        $this->notificationType = 'success';
        $this->dispatch('auto-hide-notification');
    }

    public function deactivateUser()
    {
        $this->userElement->update(['status' => 'pending']);
        $this->showDeactivateModal = false;
        $this->users = User::with(['cycle', 'filiere', 'specialite'])->where('role', '!=', 'student')->where('status', '!=', 'failed')->get();
        $this->showNotification = true;
        $this->notificationMessage = 'Personnel désactivé avec succès !';
        $this->notificationType = 'success';
        $this->dispatch('auto-hide-notification');
    }

    public function deleteUser()
    {
        $this->userElement->update(['status' => 'failed']);
        $this->showDeleteModal = false;
        $this->users = User::with(['cycle', 'filiere', 'specialite'])->where('role', '!=', 'student')->where('status', '!=', 'failed')->get();
        $this->showNotification = true;
        $this->notificationMessage = 'Personnel supprimé avec succès !';
        $this->notificationType = 'success';
        $this->dispatch('auto-hide-notification');
    }

    public function closeModal()
    {
        $this->showAddModal = false;
        $this->showEditModal = false;
        $this->showDeleteModal = false;
        $this->showDetailsModal = false;
        $this->showActivateModal = false;
        $this->showDeactivateModal = false;
    }

    public function closeNotification()
    {
        $this->showNotification = false;
    }

    // Fonction helper pour obtenir le libellé du poste
    public function getPosteLabel($poste)
    {
        $postes = [
            'dir_ism' => 'Directeur ISM',
            'dir_ifpm' => 'Directrice IFPM',
            'dir_aaf' => 'Directrice Affaires Admin. et Financières',
            'dir_aac' => 'Directeur Affaires Académiques',
            'dir_rh' => 'Directrice RH',
            'dir_mc' => 'Directrice Marketing',
            'coord_sante' => 'Coordonnateur Filière Santé',
            'coord_industrie' => 'Coordonnateur Filière Industrie',
            'coord_info' => 'Coordonnateur Informatique',
            'coord_meca' => 'Coordonnateur Génie Mécanique',
            'coord_gi' => 'Coordonnateur Génie Informatique',
            'comptable' => 'Comptable',
            'asst_dir_fp' => 'Assistante Direction Formation Pro',
            'asst_dir_is' => 'Assistante Direction Institut',
            'coord_ap' => 'Coordonnateur Activités Pédagogiques',
            'coord_hnd' => 'Coordonnateur HND',
            'coord_tourisme' => 'Coordonnateur Tourisme',
            'coord_adj_sante' => 'Coordonnateur Adjoint Santé',
            'medecin' => 'Médecin Référent',
            'gest_stocks' => 'Gestionnaire Stocks',
            'chef_entretien' => 'Chef Agent Entretien',
            'agent_scolarite' => 'Agent de Scolarité',
            'coord_droit' => 'Coordonnateur Droit',
        ];

        return $postes[$poste] ?? 'N/A';
    }

    // Fonction helper pour obtenir le libellé de la section
    public function getSectionLabel($section_id)
    {
        $sections = [
            '1' => 'ISM',
            '2' => 'IFPM',
        ];

        return $sections[$section_id] ?? 'N/A';
    }
};
?>

<x-layouts.app header="true">
    @volt
        <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-12">
            <!-- Header -->
            <header class="mb-12 text-center">
                <h1 class="text-4xl font-bold text-gray-900 bg-gradient-to-r from-indigo-600 to-purple-600 bg-clip-text text-transparent tracking-tight">Gestion du Personnel</h1>
                <p class="mt-3 text-lg text-gray-600">Créez, modifiez, supprimez des responsables et affectez-les à un cycle, une filière ou spécialité.</p>
                <button wire:click="functionShowAddModal" class="mt-6 bg-indigo-600 text-white py-3 px-8 rounded-xl hover:bg-indigo-700 transition duration-300 shadow-lg hover:shadow-xl transform hover:-translate-y-1">Ajouter un personnel</button>
            </header>

            <!-- Notification -->
            @if ($showNotification)
                <div class="fixed top-6 right-6 z-50 max-w-sm w-full" x-data="{ show: true }" x-init="setTimeout(() => show = false, 3000)" x-show="show" x-transition>
                    <div class="bg-green-100 text-green-700 p-4 rounded-xl shadow-md border-l-4 border-green-500 animate-pulse">
                        {{ $notificationMessage }}
                    </div>
                </div>
            @endif

            <!-- Modal Ajouter Personnel -->
            @if ($showAddModal)
                <div class="fixed inset-0 bg-gray-900 bg-opacity-60 flex items-center justify-center z-50">
                    <div class="bg-white rounded-2xl p-8 w-full max-w-xl max-h-[90vh] overflow-y-auto shadow-2xl transform transition-all duration-300 ease-in-out scale-100 hover:scale-[1.02]">
                        <h2 class="text-2xl font-semibold text-gray-800 mb-6">Ajouter un Personnel</h2>
                        <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                            <div>
                                <label class="block text-sm font-medium text-gray-600">Nom Complet</label>
                                <input type="text" wire:model="name" class="mt-1 w-full p-3 border border-gray-300 rounded-lg">
                                @error('name') <span class="text-red-500 text-sm">{{ $message }}</span> @endif
                            </div>
                            <div>
                                <label class="block text-sm font-medium text-gray-600">Rôle</label>
                                <select wire:model="role" class="mt-1 w-full p-3 border border-gray-300 rounded-lg">
                                    <option value="">Sélectionner un rôle</option>
                                    <option value="enseignant">Enseignant</option>
                                    <option value="filiere">Responsable de Filière</option>
                                    <option value="specialite">Responsable de Spécialité</option>
                                    <option value="concierge">Concierge</option>
                                    <option value="bibliothecaire">Bibliothécaire</option>
                                    <option value="admin">Administrateur</option>
                                </select>
                                @error('role') <span class="text-red-500 text-sm">{{ $message }}</span> @endif
                            </div>
                            <div>
                                <label class="block text-sm font-medium text-gray-600">Cycle</label>
                                <select wire:model="cycle_id" class="mt-1 w-full p-3 border border-gray-300 rounded-lg">
                                    <option value="">Sélectionner un cycle</option>
                                    @foreach ($cycles as $cycle)
                                        <option value="{{ $cycle->id }}">{{ $cycle->name }}</option>
                                    @endforeach
                                </select>
                                @error('cycle_id') <span class="text-red-500 text-sm">{{ $message }}</span> @endif
                            </div>
                            <div>
                                <label class="block text-sm font-medium text-gray-600">Filière</label>
                                <select wire:model="filiere_id" class="mt-1 w-full p-3 border border-gray-300 rounded-lg">
                                    <option value="">Sélectionner une filière</option>
                                    @foreach ($filieres as $filiere)
                                        <option value="{{ $filiere->id }}">{{ $filiere->name }}</option>
                                    @endforeach
                                </select>
                                @error('filiere_id') <span class="text-red-500 text-sm">{{ $message }}</span> @endif
                            </div>
                            <div>
                                <label class="block text-sm font-medium text-gray-600">Spécialité (optionnel)</label>
                                <select wire:model="specialite_id" class="mt-1 w-full p-3 border border-gray-300 rounded-lg">
                                    <option value="">Aucune</option>
                                    @foreach ($specialites as $specialite)
                                        <option value="{{ $specialite->id }}">{{ $specialite->name }}</option>
                                    @endforeach
                                </select>
                                @error('specialite_id') <span class="text-red-500 text-sm">{{ $message }}</span> @endif
                            </div>
                            <div>
                                <label class="block text-sm font-medium text-gray-600">Email</label>
                                <input type="email" wire:model="email" class="mt-1 w-full p-3 border border-gray-300 rounded-lg">
                                @error('email') <span class="text-red-500 text-sm">{{ $message }}</span> @endif
                            </div>
                            <div>
                                <label class="block text-sm font-medium text-gray-600">Téléphone</label>
                                <input type="text" wire:model="contact" class="mt-1 w-full p-3 border border-gray-300 rounded-lg">
                                @error('contact') <span class="text-red-500 text-sm">{{ $message }}</span> @endif
                            </div>
                        </div>
                        <div class="mt-8 flex justify-end space-x-4">
                            <button wire:click="save" class="bg-green-600 text-white py-2 px-6 rounded-lg hover:bg-green-700 transition duration-300">Valider</button>
                            <button wire:click="closeModal" class="bg-gray-600 text-white py-2 px-6 rounded-lg hover:bg-gray-700 transition duration-300">Annuler</button>
                        </div>
                    </div>
                </div>
            @endif

            <!-- Modal Modifier Personnel -->
            @if ($showEditModal)
                <div class="fixed inset-0 bg-gray-900 bg-opacity-60 flex items-center justify-center z-50">
                    <div class="bg-white rounded-2xl p-8 w-full max-w-xl max-h-[90vh] overflow-y-auto shadow-2xl transform transition-all duration-300 ease-in-out scale-100 hover:scale-[1.02]">
                        <h2 class="text-2xl font-semibold text-gray-800 mb-6">Modifier un Personnel</h2>
                        <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                            <div>
                                <label class="block text-sm font-medium text-gray-600">Nom Complet</label>
                                <input type="text" wire:model="name" class="mt-1 w-full p-3 border border-gray-300 rounded-lg">
                                @error('name') <span class="text-red-500 text-sm">{{ $message }}</span> @endif
                            </div>
                            <div>
                                <label class="block text-sm font-medium text-gray-600">Rôle</label>
                                <select wire:model="role" class="mt-1 w-full p-3 border border-gray-300 rounded-lg">
                                    <option value="">Sélectionner un rôle</option>
                                    <option value="enseignant">Enseignant</option>
                                    <option value="filiere">Responsable de Filière</option>
                                    <option value="specialite">Responsable de Spécialité</option>
                                    <option value="concierge">Concierge</option>
                                    <option value="bibliothecaire">Bibliothécaire</option>
                                    <option value="admin">Administrateur</option>
                                </select>
                                @error('role') <span class="text-red-500 text-sm">{{ $message }}</span> @endif
                            </div>
                            <div>
                                <label class="block text-sm font-medium text-gray-600">Cycle</label>
                                <select wire:model="cycle_id" class="mt-1 w-full p-3 border border-gray-300 rounded-lg">
                                    <option value="">Sélectionner un cycle</option>
                                    @foreach ($cycles as $cycle)
                                        <option value="{{ $cycle->id }}">{{ $cycle->name }}</option>
                                    @endforeach
                                </select>
                                @error('cycle_id') <span class="text-red-500 text-sm">{{ $message }}</span> @endif
                            </div>
                            <div>
                                <label class="block text-sm font-medium text-gray-600">Filière</label>
                                <select wire:model="filiere_id" class="mt-1 w-full p-3 border border-gray-300 rounded-lg">
                                    <option value="">Sélectionner une filière</option>
                                    @foreach ($filieres as $filiere)
                                        <option value="{{ $filiere->id }}">{{ $filiere->name }}</option>
                                    @endforeach
                                </select>
                                @error('filiere_id') <span class="text-red-500 text-sm">{{ $message }}</span> @endif
                            </div>
                            <div>
                                <label class="block text-sm font-medium text-gray-600">Spécialité (optionnel)</label>
                                <select wire:model="specialite_id" class="mt-1 w-full p-3 border border-gray-300 rounded-lg">
                                    <option value="">Aucune</option>
                                    @foreach ($specialites as $specialite)
                                        <option value="{{ $specialite->id }}">{{ $specialite->name }}</option>
                                    @endforeach
                                </select>
                                @error('specialite_id') <span class="text-red-500 text-sm">{{ $message }}</span> @endif
                            </div>
                            <div>
                                <label class="block text-sm font-medium text-gray-600">Email</label>
                                <input type="email" wire:model="email" class="mt-1 w-full p-3 border border-gray-300 rounded-lg">
                                @error('email') <span class="text-red-500 text-sm">{{ $message }}</span> @endif
                            </div>
                            <div>
                                <label class="block text-sm font-medium text-gray-600">Téléphone</label>
                                <input type="text" wire:model="contact" class="mt-1 w-full p-3 border border-gray-300 rounded-lg">
                                @error('contact') <span class="text-red-500 text-sm">{{ $message }}</span> @endif
                            </div>
                        </div>
                        <div class="mt-8 flex justify-end space-x-4">
                            <button wire:click="update" class="bg-indigo-600 text-white py-2 px-6 rounded-lg hover:bg-indigo-700 transition duration-300">Mettre à jour</button>
                            <button wire:click="closeModal" class="bg-gray-600 text-white py-2 px-6 rounded-lg hover:bg-gray-700 transition duration-300">Annuler</button>
                        </div>
                    </div>
                </div>
            @endif

            <!-- Modal Supprimer Personnel -->
            @if ($showDeleteModal)
                <div class="fixed inset-0 bg-gray-900 bg-opacity-60 flex items-center justify-center z-50">
                    <div class="bg-white rounded-2xl p-6 w-full max-w-md shadow-2xl transform transition-all duration-300 ease-in-out">
                        <h3 class="text-xl font-semibold text-gray-800 mb-4">Supprimer un Personnel</h3>
                        <p class="mb-4 text-gray-600">Voulez-vous supprimer {{ $userElement->name ?? 'N/A' }} ?</p>
                        <div class="flex justify-end space-x-4">
                            <button wire:click="deleteUser" class="bg-red-600 text-white py-2 px-4 rounded-xl hover:bg-red-700 transition duration-300 shadow-md">Oui</button>
                            <button wire:click="closeModal" class="bg-gray-500 text-white py-2 px-4 rounded-xl hover:bg-gray-600 transition duration-300 shadow-md">Annuler</button>
                        </div>
                    </div>
                </div>
            @endif

            <!-- Modal Détails Personnel -->
            @if ($showDetailsModal)
                <div class="fixed inset-0 bg-gray-900 bg-opacity-60 flex items-center justify-center z-50">
                    <div class="bg-white rounded-2xl p-6 w-full max-w-md shadow-2xl transform transition-all duration-300 ease-in-out">
                        <h3 class="text-xl font-semibold text-gray-800 mb-4">Détails du Personnel</h3>
                        
                        <!-- Photo de profil -->
                        @if($userElement->photo)
                            <div class="flex justify-center mb-4">
                                <img src="https://ism-ndazoa.com/{{ $userElement->photo }}" alt="Photo de profil" class="w-24 h-24 rounded-full object-cover border-2 border-indigo-500">
                            </div>
                        @endif

                        <div class="space-y-3">
                            <p><span class="font-medium text-gray-700">Nom :</span> {{ $userElement->name ?? 'N/A' }}</p>
                            <p><span class="font-medium text-gray-700">Poste :</span> {{ $this->getPosteLabel($userElement->poste) }}</p>
                            <p><span class="font-medium text-gray-700">Section :</span> {{ $this->getSectionLabel($userElement->section_id) }}</p>
                            <p><span class="font-medium text-gray-700">Rôle :</span>
                                @switch($userElement->role)
                                    @case('filiere') Responsable de Filière @break
                                    @case('specialite') Responsable de Spécialité @break
                                    @case('enseignant') Enseignant @break
                                    @case('concierge') Concierge @break
                                    @case('bibliothecaire') Bibliothécaire @break
                                    @case('admin') Administrateur @break
                                    @default N/A @break
                                @endswitch
                            </p>
                            <p><span class="font-medium text-gray-700">Cycle :</span> {{ $userElement->cycle->name ?? '-' }}</p>
                            <p><span class="font-medium text-gray-700">Filière :</span> {{ $userElement->filiere->name ?? '-' }}</p>
                            <p><span class="font-medium text-gray-700">Spécialité :</span> {{ $userElement->specialite->name ?? '-' }}</p>
                            <p><span class="font-medium text-gray-700">Email :</span> {{ $userElement->email ?? 'N/A' }}</p>
                            <p><span class="font-medium text-gray-700">Téléphone :</span> {{ $userElement->contact ?? 'N/A' }}</p>
                        </div>
                        <div class="mt-6 flex justify-end">
                            <button wire:click="closeModal" class="bg-gray-500 text-white py-2 px-4 rounded-xl hover:bg-gray-600 transition duration-300 shadow-md">Fermer</button>
                        </div>
                    </div>
                </div>
            @endif

            <!-- Modal Activer Personnel -->
            @if ($showActivateModal)
                <div class="fixed inset-0 bg-gray-900 bg-opacity-60 flex items-center justify-center z-50">
                    <div class="bg-white rounded-2xl p-6 w-full max-w-md shadow-2xl">
                        <h3 class="text-xl font-semibold text-gray-800 mb-4">Activer un Personnel</h3>
                        <p class="mb-4 text-gray-600">Voulez-vous activer {{ $userElement->name ?? 'N/A' }} ?</p>
                        <div class="flex justify-end space-x-4">
                            <button wire:click="activateUser" class="bg-green-600 text-white py-2 px-4 rounded-xl hover:bg-green-700 transition duration-300">Oui</button>
                            <button wire:click="closeModal" class="bg-gray-500 text-white py-2 px-4 rounded-xl hover:bg-gray-600 transition duration-300">Annuler</button>
                        </div>
                    </div>
                </div>
            @endif

            <!-- Modal Désactiver Personnel -->
            @if ($showDeactivateModal)
                <div class="fixed inset-0 bg-gray-900 bg-opacity-60 flex items-center justify-center z-50">
                    <div class="bg-white rounded-2xl p-6 w-full max-w-md shadow-2xl">
                        <h3 class="text-xl font-semibold text-gray-800 mb-4">Désactiver un Personnel</h3>
                        <p class="mb-4 text-gray-600">Voulez-vous désactiver {{ $userElement->name ?? 'N/A' }} ?</p>
                        <div class="flex justify-end space-x-4">
                            <button wire:click="deactivateUser" class="bg-yellow-600 text-white py-2 px-4 rounded-xl hover:bg-yellow-700 transition duration-300">Oui</button>
                            <button wire:click="closeModal" class="bg-gray-500 text-white py-2 px-4 rounded-xl hover:bg-gray-600 transition duration-300">Annuler</button>
                        </div>
                    </div>
                </div>
            @endif

            <!-- Liste du Personnel -->
            <div class="bg-white rounded-2xl shadow-lg p-8">
                <h2 class="text-2xl font-semibold text-gray-800 mb-6">Liste du Personnel</h2>
                <div class="overflow-x-auto">
                    <table class="w-full text-left border-separate border-spacing-y-2">
                        <thead>
                            <tr class="bg-gray-100 rounded-lg">
                                <th class="p-4 text-sm font-medium text-gray-600">Photo</th>
                                <th class="p-4 text-sm font-medium text-gray-600">Nom</th>
                                <th class="p-4 text-sm font-medium text-gray-600">Poste</th>
                                <th class="p-4 text-sm font-medium text-gray-600">Section</th>
                                <th class="p-4 text-sm font-medium text-gray-600">Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            @foreach ($users as $user)
                                <tr class="bg-gray-50 rounded-lg hover:bg-gray-100 transition duration-200">
                                    <td class="p-4">
                                        @if($user->photo)
                                            <img src="https://ism-ndazoa.com/{{$user->photo }}" alt="Photo" class="w-10 h-10 rounded-full object-cover border-2 border-gray-300">
                                        @else
                                            <div class="w-10 h-10 rounded-full bg-gray-300 flex items-center justify-center">
                                                <svg class="w-6 h-6 text-gray-500" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M16 7a4 4 0 11-8 0 4 4 0 018 0zM12 14a7 7 0 00-7 7h14a7 7 0 00-7-7z"></path>
                                                </svg>
                                            </div>
                                        @endif
                                    </td>
                                    <td class="p-4">{{ $user->name }}</td>
                                    <td class="p-4">{{ $this->getPosteLabel($user->poste) }}</td>
                                    <td class="p-4">{{ $this->getSectionLabel($user->section_id) }}</td>
                                    <td class="p-4">
                                        @if ($user->status == 'pending')
                                            <button wire:click="functionShowActivateModal({{ $user->id }})" class="inline-flex items-center px-3 py-1 bg-green-600 text-white text-sm rounded hover:bg-green-700 focus:outline-none focus:ring-2 focus:ring-green-500 mr-2">
                                                <svg class="w-4 h-4 mr-1" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 13l4 4L19 7" />
                                                </svg>
                                                Activer
                                            </button>
                                        @elseif ($user->status == 'Success')
                                            <button wire:click="functionShowDeactivateModal({{ $user->id }})" class="inline-flex items-center px-3 py-1 bg-yellow-600 text-white text-sm rounded hover:bg-yellow-700 focus:outline-none focus:ring-2 focus:ring-yellow-500 mr-2">
                                                <svg class="w-4 h-4 mr-1" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 8v4m0 4h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z" />
                                                </svg>
                                                Désactiver
                                            </button>
                                        @endif
                                        <button wire:click="functionShowDetailsModal({{ $user->id }})" class="inline-flex items-center px-3 py-1 bg-blue-600 text-white text-sm rounded hover:bg-blue-700 focus:outline-none focus:ring-2 focus:ring-blue-500 mr-2">
                                            <svg class="w-4 h-4 mr-1" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M13 16h-1v-4h-1m1-4h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z" />
                                            </svg>
                                            Détails
                                        </button>
                                        <button wire:click="functionShowEditModal({{ $user->id }})" class="inline-flex items-center px-3 py-1 bg-indigo-600 text-white text-sm rounded hover:bg-indigo-700 focus:outline-none focus:ring-2 focus:ring-indigo-500 mr-2">
                                            <svg class="w-4 h-4 mr-1" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M11 5H6a2 2 0 00-2 2v14a2 2 0 002 2h14a2 2 0 002-2v-5m-1.414-9.414a2 2 0 112.828 2.828L11.828 15H9v-2.828l8.586-8.586z" />
                                            </svg>
                                            Modifier
                                        </button>
                                        <button wire:click="functionShowDeleteModal({{ $user->id }})" class="inline-flex items-center px-3 py-1 bg-red-600 text-white text-sm rounded hover:bg-red-700 focus:outline-none focus:ring-2 focus:ring-red-500">
                                            <svg class="w-4 h-4 mr-1" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12" />
                                            </svg>
                                            Supprimer
                                        </button>
                                    </td>
                                </tr>
                            @endforeach
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    @endvolt
</x-layouts.app>