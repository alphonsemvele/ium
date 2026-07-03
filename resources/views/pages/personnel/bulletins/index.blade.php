<?php
use function Laravel\Folio\{name, middleware};
use Livewire\Volt\Component;
use App\Models\PaiementSalaire;

name('personnel.bulletins');
middleware(['auth', 'verified', 'role']);

new class extends Component {
    public array $annees = [];

    // Option 1 — un mois
    public $anneeUn;
    public int $moisUn = 1;

    // Option 2 — une plage (mois/année → mois/année)
    public $anneeDebut;
    public int $moisDebut = 1;
    public $anneeFin;
    public int $moisFin = 12;

    public function mount()
    {
        $paiements = PaiementSalaire::where('user_id', auth()->id())
            ->orderByDesc('annee')->orderByDesc('mois')->get(['annee', 'mois']);

        $this->annees = $paiements->pluck('annee')->unique()->values()->toArray();

        $anneeCourante = $this->annees[0] ?? (int) date('Y');
        $dernier = $paiements->first();

        $this->anneeUn    = $anneeCourante;
        $this->moisUn     = $dernier->mois ?? (int) date('n');
        $this->anneeDebut = min($this->annees ?: [$anneeCourante]);
        $this->anneeFin   = $anneeCourante;
    }

    public function getBulletinsProperty()
    {
        return PaiementSalaire::where('user_id', auth()->id())
            ->orderByDesc('annee')->orderByDesc('mois')->get();
    }
};
?>

<x-layouts.app header="true">
    @volt
        @php
            $moisNoms = [1=>'Janvier',2=>'Février',3=>'Mars',4=>'Avril',5=>'Mai',6=>'Juin',7=>'Juillet',8=>'Août',9=>'Septembre',10=>'Octobre',11=>'Novembre',12=>'Décembre'];
            $anneesOptions = $annees ?: [(int) date('Y')];
        @endphp
        <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-12">

            <header class="mb-8 flex items-center gap-4">
                <a href="/personnel" class="text-gray-400 hover:text-emerald-600 transition-colors">
                    <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 19l-7-7 7-7"/></svg>
                </a>
                <div>
                    <h1 class="text-3xl font-extrabold text-gray-800 tracking-tight">Mon Bulletin de Paie</h1>
                    <p class="mt-1 text-gray-500 text-sm">Téléchargez vos fiches de paie par mois ou par période, en PDF.</p>
                </div>
            </header>

            <div class="grid grid-cols-1 lg:grid-cols-5 gap-6 items-start">

                {{-- ══════════ FORMULAIRE (gauche) ══════════ --}}
                <div class="lg:col-span-2 space-y-5">

                    {{-- Option 1 : un mois --}}
                    <div class="bg-white rounded-2xl shadow-sm border border-gray-100 p-5">
                        <div class="flex items-center gap-2 mb-4">
                            <span class="w-7 h-7 rounded-full bg-emerald-100 text-emerald-700 text-sm font-bold flex items-center justify-center">1</span>
                            <h2 class="text-base font-bold text-gray-800">Télécharger un mois</h2>
                        </div>
                        <div class="grid grid-cols-2 gap-3">
                            <div>
                                <label class="block text-xs font-medium text-gray-500 mb-1">Mois</label>
                                <select wire:model.live="moisUn" class="w-full px-3 py-2 text-sm border border-gray-200 rounded-lg focus:ring-2 focus:ring-emerald-400 bg-white">
                                    @foreach ($moisNoms as $n => $nom)<option value="{{ $n }}">{{ $nom }}</option>@endforeach
                                </select>
                            </div>
                            <div>
                                <label class="block text-xs font-medium text-gray-500 mb-1">Année</label>
                                <select wire:model.live="anneeUn" class="w-full px-3 py-2 text-sm border border-gray-200 rounded-lg focus:ring-2 focus:ring-emerald-400 bg-white">
                                    @foreach ($anneesOptions as $a)<option value="{{ $a }}">{{ $a }}</option>@endforeach
                                </select>
                            </div>
                        </div>
                        <a href="{{ route('bulletin.periode', ['annee_debut'=>$anneeUn,'annee_fin'=>$anneeUn,'mois_debut'=>$moisUn,'mois_fin'=>$moisUn]) }}"
                           class="mt-4 w-full inline-flex items-center justify-center gap-2 bg-emerald-600 hover:bg-emerald-700 text-white text-sm font-semibold py-2.5 px-4 rounded-lg transition">
                            <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 16v1a3 3 0 003 3h10a3 3 0 003-3v-1m-4-4l-4 4m0 0l-4-4m4 4V4"/></svg>
                            Télécharger {{ $moisNoms[$moisUn] ?? '' }} {{ $anneeUn }}
                        </a>
                    </div>

                    {{-- Option 2 : une plage --}}
                    <div class="bg-white rounded-2xl shadow-sm border border-gray-100 p-5">
                        <div class="flex items-center gap-2 mb-4">
                            <span class="w-7 h-7 rounded-full bg-indigo-100 text-indigo-700 text-sm font-bold flex items-center justify-center">2</span>
                            <h2 class="text-base font-bold text-gray-800">Télécharger une plage</h2>
                        </div>

                        <p class="text-xs font-semibold text-gray-400 uppercase tracking-wide mb-1">Du</p>
                        <div class="grid grid-cols-2 gap-3 mb-3">
                            <select wire:model.live="moisDebut" class="w-full px-3 py-2 text-sm border border-gray-200 rounded-lg focus:ring-2 focus:ring-indigo-400 bg-white">
                                @foreach ($moisNoms as $n => $nom)<option value="{{ $n }}">{{ $nom }}</option>@endforeach
                            </select>
                            <select wire:model.live="anneeDebut" class="w-full px-3 py-2 text-sm border border-gray-200 rounded-lg focus:ring-2 focus:ring-indigo-400 bg-white">
                                @foreach ($anneesOptions as $a)<option value="{{ $a }}">{{ $a }}</option>@endforeach
                            </select>
                        </div>

                        <p class="text-xs font-semibold text-gray-400 uppercase tracking-wide mb-1">Au</p>
                        <div class="grid grid-cols-2 gap-3">
                            <select wire:model.live="moisFin" class="w-full px-3 py-2 text-sm border border-gray-200 rounded-lg focus:ring-2 focus:ring-indigo-400 bg-white">
                                @foreach ($moisNoms as $n => $nom)<option value="{{ $n }}">{{ $nom }}</option>@endforeach
                            </select>
                            <select wire:model.live="anneeFin" class="w-full px-3 py-2 text-sm border border-gray-200 rounded-lg focus:ring-2 focus:ring-indigo-400 bg-white">
                                @foreach ($anneesOptions as $a)<option value="{{ $a }}">{{ $a }}</option>@endforeach
                            </select>
                        </div>

                        <a href="{{ route('bulletin.periode', ['annee_debut'=>$anneeDebut,'mois_debut'=>$moisDebut,'annee_fin'=>$anneeFin,'mois_fin'=>$moisFin]) }}"
                           class="mt-4 w-full inline-flex items-center justify-center gap-2 bg-indigo-600 hover:bg-indigo-700 text-white text-sm font-semibold py-2.5 px-4 rounded-lg transition">
                            <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 16v1a3 3 0 003 3h10a3 3 0 003-3v-1m-4-4l-4 4m0 0l-4-4m4 4V4"/></svg>
                            Télécharger la plage
                        </a>
                        <p class="text-xs text-gray-400 mt-2">De {{ $moisNoms[$moisDebut] ?? '' }} {{ $anneeDebut }} à {{ $moisNoms[$moisFin] ?? '' }} {{ $anneeFin }} — un seul PDF.</p>
                    </div>
                </div>

                {{-- ══════════ TABLEAU (droite) ══════════ --}}
                <div class="lg:col-span-3 bg-white rounded-2xl shadow-sm border border-gray-100 overflow-hidden">
                    <div class="px-6 py-4 border-b border-gray-100">
                        <p class="text-sm font-semibold text-gray-700">Tous mes bulletins ({{ $this->bulletins->count() }})</p>
                    </div>
                    <div class="overflow-x-auto">
                        <table class="w-full text-sm text-left">
                            <thead class="bg-emerald-50 text-emerald-800 text-xs uppercase tracking-wide border-b border-emerald-100">
                                <tr>
                                    <th class="py-3 px-5">Période</th>
                                    <th class="py-3 px-5 text-right">Net à payer</th>
                                    <th class="py-3 px-5 text-center">Statut</th>
                                    <th class="py-3 px-5 text-center">Actions</th>
                                </tr>
                            </thead>
                            <tbody class="divide-y divide-gray-100">
                                @forelse ($this->bulletins as $b)
                                    @php $badge = $b->statut_badge; @endphp
                                    <tr class="hover:bg-emerald-50/30 transition-colors">
                                        <td class="py-4 px-5 font-semibold text-gray-800">{{ $moisNoms[$b->mois] ?? $b->mois }} {{ $b->annee }}</td>
                                        <td class="py-4 px-5 text-right font-bold text-gray-900">{{ number_format($b->salaire_net, 0, ',', ' ') }} FCFA</td>
                                        <td class="py-4 px-5 text-center">
                                            <span class="inline-block px-2.5 py-1 rounded-full text-xs font-medium" style="background: {{ $badge['bg'] }}; color: {{ $badge['color'] }};">{{ $badge['label'] }}</span>
                                        </td>
                                        <td class="py-4 px-5">
                                            <div class="flex items-center justify-center gap-2">
                                                <a href="{{ route('bulletin.preview', $b->id) }}" target="_blank"
                                                   class="inline-flex items-center gap-1 text-gray-600 hover:text-indigo-600 text-xs font-medium px-2.5 py-1.5 rounded-lg border border-gray-200 hover:border-indigo-300 transition">
                                                    <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 12a3 3 0 11-6 0 3 3 0 016 0z"/><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M2.458 12C3.732 7.943 7.523 5 12 5c4.478 0 8.268 2.943 9.542 7-1.274 4.057-5.064 7-9.542 7-4.477 0-8.268-2.943-9.542-7z"/></svg>
                                                    Aperçu
                                                </a>
                                                <a href="{{ route('bulletin.pdf', $b->id) }}"
                                                   class="inline-flex items-center gap-1 bg-emerald-600 hover:bg-emerald-700 text-white text-xs font-semibold px-3 py-1.5 rounded-lg transition">
                                                    <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 16v1a3 3 0 003 3h10a3 3 0 003-3v-1m-4-4l-4 4m0 0l-4-4m4 4V4"/></svg>
                                                    PDF
                                                </a>
                                            </div>
                                        </td>
                                    </tr>
                                @empty
                                    <tr>
                                        <td colspan="4" class="py-16 text-center text-gray-400">
                                            <svg class="w-14 h-14 mx-auto mb-3 text-gray-200" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="1.5" d="M9 12h6m-6 4h6m2 5H7a2 2 0 01-2-2V5a2 2 0 012-2h5.586a1 1 0 01.707.293l5.414 5.414a1 1 0 01.293.707V19a2 2 0 01-2 2z"/></svg>
                                            <p class="font-medium text-gray-500">Aucun bulletin disponible.</p>
                                            <p class="text-sm mt-1">Vos bulletins apparaîtront ici une fois édités par le service RH.</p>
                                        </td>
                                    </tr>
                                @endforelse
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    @endvolt
</x-layouts.app>
