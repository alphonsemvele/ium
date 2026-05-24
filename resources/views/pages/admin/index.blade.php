<?php
use function Laravel\Folio\{name, middleware};
use Livewire\Volt\Component;

middleware(['auth', 'verified', 'role']);

?>

<x-layouts.app header='true'>
    @volt
    <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-8">

        <!-- Navigation rapide -->
        <nav class="mb-10 sticky top-0 bg-white/80 backdrop-blur-sm py-4 -mx-4 px-4 z-10 border-b border-gray-100">
            <div class="flex flex-wrap justify-center gap-2">
                <a href="#academique"
                    class="px-4 py-2 bg-indigo-50 text-indigo-700 rounded-full text-sm font-medium hover:bg-indigo-100 transition flex items-center gap-2">
                    <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                            d="M12 6.253v13m0-13C10.832 5.477 9.246 5 7.5 5S4.168 5.477 3 6.253v13C4.168 18.477 5.754 18 7.5 18s3.332.477 4.5 1.253m0-13C13.168 5.477 14.754 5 16.5 5c1.747 0 3.332.477 4.5 1.253v13C19.832 18.477 18.246 18 16.5 18c-1.747 0-3.332.477-4.5 1.253">
                        </path>
                    </svg>
                    Académique
                </a>
                <a href="#utilisateurs"
                    class="px-4 py-2 bg-purple-50 text-purple-700 rounded-full text-sm font-medium hover:bg-purple-100 transition flex items-center gap-2">
                    <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                            d="M17 20h5v-2a3 3 0 00-5.356-1.857M17 20H7m10 0v-2c0-.656-.126-1.283-.356-1.857M7 20H2v-2a3 3 0 015.356-1.857M7 20v-2c0-.656.126-1.283.356-1.857m0 0a5.002 5.002 0 019.288 0M15 7a3 3 0 11-6 0 3 3 0 016 0zm6 3a2 2 0 11-4 0 2 2 0 014 0zM7 10a2 2 0 11-4 0 2 2 0 014 0z">
                        </path>
                    </svg>
                    Utilisateurs
                </a>
                <a href="#vie-etudiante"
                    class="px-4 py-2 bg-blue-50 text-blue-700 rounded-full text-sm font-medium hover:bg-blue-100 transition flex items-center gap-2">
                    <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                            d="M4.26 10.147a60.436 60.436 0 00-.491 6.347A48.627 48.627 0 0112 20.904a48.627 48.627 0 018.232-4.41 60.46 60.46 0 00-.491-6.347m-15.482 0a50.57 50.57 0 00-2.658-.813A59.905 59.905 0 0112 3.493a59.902 59.902 0 0110.399 5.84c-.896.248-1.783.52-2.658.814m-15.482 0A50.697 50.697 0 0112 13.489a50.702 50.702 0 017.74-3.342M6.75 15a.75.75 0 100-1.5.75.75 0 000 1.5zm0 0v-3.675A55.378 55.378 0 0112 8.443m-7.007 11.55A5.981 5.981 0 006.75 15.75v-1.5">
                        </path>
                    </svg>
                    Vie Étudiante
                </a>
                <a href="#communication"
                    class="px-4 py-2 bg-green-50 text-green-700 rounded-full text-sm font-medium hover:bg-green-100 transition flex items-center gap-2">
                    <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                            d="M8 12h.01M12 12h.01M16 12h.01M21 12c0 4.418-4.03 8-9 8a9.863 9.863 0 01-4.255-.949L3 20l1.395-3.72C3.512 15.042 3 13.574 3 12c0-4.418 4.03-8 9-8s9 3.582 9 8z">
                        </path>
                    </svg>
                    Communication
                </a>
                <a href="#infrastructure"
                    class="px-4 py-2 bg-orange-50 text-orange-700 rounded-full text-sm font-medium hover:bg-orange-100 transition flex items-center gap-2">
                    <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                            d="M19 21V5a2 2 0 00-2-2H7a2 2 0 00-2 2v16m14 0h2m-2 0h-5m-9 0H3m2 0h5M9 7h1m-1 4h1m4-4h1m-1 4h1m-5 10v-5a1 1 0 011-1h2a1 1 0 011 1v5m-4 0h4">
                        </path>
                    </svg>
                    Infrastructure
                </a>
                <a href="#administration"
                    class="px-4 py-2 bg-gray-100 text-gray-700 rounded-full text-sm font-medium hover:bg-gray-200 transition flex items-center gap-2">
                    <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                            d="M10.325 4.317c.426-1.756 2.924-1.756 3.35 0a1.724 1.724 0 002.573 1.066c1.543-.94 3.31.826 2.37 2.37a1.724 1.724 0 001.065 2.572c1.756.426 1.756 2.924 0 3.35a1.724 1.724 0 00-1.066 2.573c.94 1.543-.826 3.31-2.37 2.37a1.724 1.724 0 00-2.572 1.065c-.426 1.756-2.924 1.756-3.35 0a1.724 1.724 0 00-2.573-1.066c-1.543.94-3.31-.826-2.37-2.37a1.724 1.724 0 00-1.065-2.572c-1.756-.426-1.756-2.924 0-3.35a1.724 1.724 0 001.066-2.573c-.94-1.543.826-3.31 2.37-2.37.996.608 2.296.07 2.572-1.065z">
                        </path>
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                            d="M15 12a3 3 0 11-6 0 3 3 0 016 0z"></path>
                    </svg>
                    Administration
                </a>
            </div>
        </nav>

        <!-- ==================== GESTION ACADÉMIQUE ==================== -->
        <section id="academique" class="mb-16 scroll-mt-24">
            <div class="flex items-center mb-8">
                <div
                    class="flex-shrink-0 w-12 h-12 bg-indigo-500 rounded-xl flex items-center justify-center mr-4 shadow-lg">
                    <svg class="w-6 h-6 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                            d="M12 6.253v13m0-13C10.832 5.477 9.246 5 7.5 5S4.168 5.477 3 6.253v13C4.168 18.477 5.754 18 7.5 18s3.332.477 4.5 1.253m0-13C13.168 5.477 14.754 5 16.5 5c1.747 0 3.332.477 4.5 1.253v13C19.832 18.477 18.246 18 16.5 18c-1.747 0-3.332.477-4.5 1.253">
                        </path>
                    </svg>
                </div>
                <div>
                    <h2 class="text-2xl font-bold text-gray-800">Gestion Académique</h2>
                    <p class="text-gray-500 text-sm">Cycles, filières, spécialités, UE, cours et examens</p>
                </div>
            </div>

            <div class="grid grid-cols-2 sm:grid-cols-3 lg:grid-cols-6 gap-5">
                <!-- Cycle -->
                <a href="/admin/cycle"
                    class="group bg-white rounded-xl shadow-md p-5 text-center transition transform hover:-translate-y-1 hover:shadow-lg border-t-4 border-indigo-500">
                    <div class="flex justify-center mb-3">
                        <div
                            class="w-12 h-12 bg-indigo-100 rounded-full flex items-center justify-center group-hover:bg-indigo-200 transition">
                            <svg class="w-6 h-6 text-indigo-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                    d="M4 4v5h.582m15.356 2A8.001 8.001 0 004.582 9m0 0H9m11 11v-5h-.581m0 0a8.003 8.003 0 01-15.357-2m15.357 2H15">
                                </path>
                            </svg>
                        </div>
                    </div>
                    <h3 class="font-semibold text-gray-800 text-sm">Cycle</h3>
                    <p class="text-xs text-gray-500 mt-1">Licence, Master...</p>
                </a>

                <a href="/admin/departement"
                    class="group bg-white rounded-xl shadow-md p-5 text-center transition transform hover:-translate-y-1 hover:shadow-lg border-t-4 border-indigo-500">
                    <div class="flex justify-center mb-3">
                        <div
                            class="w-12 h-12 bg-indigo-100 rounded-full flex items-center justify-center group-hover:bg-indigo-200 transition">
                            <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                    d="M19 21V5a2 2 0 00-2-2H7a2 2 0 00-2 2v16m14 0h2m-2 0h-5m-9 0H3m2 0h5M9 7h1m-1 4h1m4-4h1m-1 4h1m-5 10v-5a1 1 0 011-1h2a1 1 0 011 1v5m-4 0h4">
                                </path>
                            </svg>
                        </div>
                    </div>
                    <h3 class="font-semibold text-gray-800 text-sm">Départements</h3>
                    <p class="text-xs text-gray-500 mt-1">Droit,...</p>
                </a>

                <!-- Filière -->
                <a href="/admin/filiere"
                    class="group bg-white rounded-xl shadow-md p-5 text-center transition transform hover:-translate-y-1 hover:shadow-lg border-t-4 border-indigo-500">
                    <div class="flex justify-center mb-3">
                        <div
                            class="w-12 h-12 bg-indigo-100 rounded-full flex items-center justify-center group-hover:bg-indigo-200 transition">
                            <svg class="w-6 h-6 text-indigo-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                    d="M19 11H5m14 0a2 2 0 012 2v6a2 2 0 01-2 2H5a2 2 0 01-2-2v-6a2 2 0 012-2m14 0V9a2 2 0 00-2-2M5 11V9a2 2 0 012-2m0 0V5a2 2 0 012-2h6a2 2 0 012 2v2M7 7h10">
                                </path>
                            </svg>
                        </div>
                    </div>
                    <h3 class="font-semibold text-gray-800 text-sm">Filière</h3>
                    <p class="text-xs text-gray-500 mt-1">Programmes d'études</p>
                </a>

                <!-- Spécialité -->
                <a href="/admin/specialite"
                    class="group bg-white rounded-xl shadow-md p-5 text-center transition transform hover:-translate-y-1 hover:shadow-lg border-t-4 border-indigo-500">
                    <div class="flex justify-center mb-3">
                        <div
                            class="w-12 h-12 bg-indigo-100 rounded-full flex items-center justify-center group-hover:bg-indigo-200 transition">
                            <svg class="w-6 h-6 text-indigo-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                    d="M9 5H7a2 2 0 00-2 2v12a2 2 0 002 2h10a2 2 0 002-2V7a2 2 0 00-2-2h-2M9 5a2 2 0 002 2h2a2 2 0 002-2M9 5a2 2 0 012-2h2a2 2 0 012 2m-3 7h3m-3 4h3m-6-4h.01M9 16h.01">
                                </path>
                            </svg>
                        </div>
                    </div>
                    <h3 class="font-semibold text-gray-800 text-sm">Spécialité</h3>
                    <p class="text-xs text-gray-500 mt-1">Options de filière</p>
                </a>

                <!-- UE -->
                <a href="/admin/ue"
                    class="group bg-white rounded-xl shadow-md p-5 text-center transition transform hover:-translate-y-1 hover:shadow-lg border-t-4 border-indigo-500">
                    <div class="flex justify-center mb-3">
                        <div
                            class="w-12 h-12 bg-indigo-100 rounded-full flex items-center justify-center group-hover:bg-indigo-200 transition">
                            <svg class="w-6 h-6 text-indigo-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                    d="M9 12h6m-6 4h6m2 5H7a2 2 0 01-2-2V5a2 2 0 012-2h5.586a1 1 0 01.707.293l5.414 5.414a1 1 0 01.293.707V19a2 2 0 01-2 2z">
                                </path>
                            </svg>
                        </div>
                    </div>
                    <h3 class="font-semibold text-gray-800 text-sm">UE</h3>
                    <p class="text-xs text-gray-500 mt-1">Unités d'enseign.</p>
                </a>

                <!-- Cours -->
                <a href="/admin/cours"
                    class="group bg-white rounded-xl shadow-md p-5 text-center transition transform hover:-translate-y-1 hover:shadow-lg border-t-4 border-indigo-500">
                    <div class="flex justify-center mb-3">
                        <div
                            class="w-12 h-12 bg-indigo-100 rounded-full flex items-center justify-center group-hover:bg-indigo-200 transition">
                            <svg class="w-6 h-6 text-indigo-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                    d="M8 7V3m8 4V3m-9 8h10M5 21h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v12a2 2 0 002 2z">
                                </path>
                            </svg>
                        </div>
                    </div>
                    <h3 class="font-semibold text-gray-800 text-sm">Matières</h3>
                    <p class="text-xs text-gray-500 mt-1">Gestion des matières</p>
                </a>

                <!-- Notes / CC & Exams -->
                <a href="/admin/notes"
                    class="group bg-white rounded-xl shadow-md p-5 text-center transition transform hover:-translate-y-1 hover:shadow-lg border-t-4 border-indigo-500">
                    <div class="flex justify-center mb-3">
                        <div
                            class="w-12 h-12 bg-indigo-100 rounded-full flex items-center justify-center group-hover:bg-indigo-200 transition">
                            <svg class="w-6 h-6 text-indigo-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                    d="M9 19v-6a2 2 0 00-2-2H5a2 2 0 00-2 2v6a2 2 0 002 2h2a2 2 0 002-2zm0 0V9a2 2 0 012-2h2a2 2 0 012 2v10m-6 0a2 2 0 002 2h2a2 2 0 002-2m0 0V5a2 2 0 012-2h2a2 2 0 012 2v14a2 2 0 01-2 2h-2a2 2 0 01-2-2z">
                                </path>
                            </svg>
                        </div>
                    </div>
                    <h3 class="font-semibold text-gray-800 text-sm">Contrôle Continu & Exams</h3>
                    <p class="text-xs text-gray-500 mt-1">Notes & évaluations</p>
                </a>

                <!-- Rattrapage -->
                <a href="/admin/rattrapage"
                    class="group bg-white rounded-xl shadow-md p-5 text-center transition transform hover:-translate-y-1 hover:shadow-lg border-t-4 border-orange-500">
                    <div class="flex justify-center mb-3">
                        <div class="w-12 h-12 bg-orange-100 rounded-full flex items-center justify-center group-hover:bg-orange-200 transition">
                            <svg class="w-6 h-6 text-orange-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                    d="M4 4v5h.582m15.356 2A8.001 8.001 0 004.582 9m0 0H9m11 11v-5h-.581m0 0a8.003 8.003 0 01-15.357-2m15.357 2H15"/>
                            </svg>
                        </div>
                    </div>
                    <h3 class="font-semibold text-gray-800 text-sm">Rattrapage</h3>
                    <p class="text-xs text-gray-500 mt-1">Notes de rattrapage</p>
                </a>

                <!-- Examens -->
                <a href="/admin/examen"
                    class="group bg-white rounded-xl shadow-md p-5 text-center transition transform hover:-translate-y-1 hover:shadow-lg border-t-4 border-indigo-500">
                    <div class="flex justify-center mb-3">
                        <div
                            class="w-12 h-12 bg-indigo-100 rounded-full flex items-center justify-center group-hover:bg-indigo-200 transition">
                            <svg class="w-6 h-6 text-indigo-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                    d="M9 5H7a2 2 0 00-2 2v12a2 2 0 002 2h10a2 2 0 002-2V7a2 2 0 00-2-2h-2M9 5a2 2 0 002 2h2a2 2 0 002-2M9 5a2 2 0 012-2h2a2 2 0 012 2m-6 9l2 2 4-4">
                                </path>
                            </svg>
                        </div>
                    </div>
                    <h3 class="font-semibold text-gray-800 text-sm">Examens</h3>
                    <p class="text-xs text-gray-500 mt-1">Sessions & épreuves</p>
                </a>

                <!-- Barbillard -->
                <a href="/admin/barbillard"
                    class="group bg-white rounded-xl shadow-md p-5 text-center transition transform hover:-translate-y-1 hover:shadow-lg border-t-4 border-indigo-500">
                    <div class="flex justify-center mb-3">
                        <div
                            class="w-12 h-12 bg-indigo-100 rounded-full flex items-center justify-center group-hover:bg-indigo-200 transition">
                            <svg class="w-6 h-6 text-indigo-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                    d="M9 5H7a2 2 0 00-2 2v12a2 2 0 002 2h10a2 2 0 002-2V7a2 2 0 00-2-2h-2M9 5a2 2 0 002 2h2a2 2 0 002-2M9 5a2 2 0 012-2h2a2 2 0 012 2m-6 9l2 2 4-4">
                                </path>
                            </svg>
                        </div>
                    </div>
                    <h3 class="font-semibold text-gray-800 text-sm">Barbillard</h3>
                    <p class="text-xs text-gray-500 mt-1">Affichage des notes des étudiants</p>
                </a>

                <!-- ── NOUVEAU : Relevé de Notes ── -->
                <a href="/admin/releve"
                    class="group bg-white rounded-xl shadow-md p-5 text-center transition transform hover:-translate-y-1 hover:shadow-lg border-t-4 border-indigo-600">
                    <div class="flex justify-center mb-3">
                        <div
                            class="w-12 h-12 bg-indigo-100 rounded-full flex items-center justify-center group-hover:bg-indigo-200 transition">
                            <svg class="w-6 h-6 text-indigo-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                    d="M4 16v1a3 3 0 003 3h10a3 3 0 003-3v-1m-4-4l-4 4m0 0l-4-4m4 4V4"/>
                            </svg>
                        </div>
                    </div>
                    <h3 class="font-semibold text-gray-800 text-sm">Relevé de Notes</h3>
                    <p class="text-xs text-gray-500 mt-1">Téléchargement par étudiant</p>
                </a>

            </div>
        </section>

<div class="mt-10 mb-3">
    <h2 class="text-xs font-bold text-gray-400 uppercase tracking-widest flex items-center gap-2">
        <span class="w-5 h-0.5 rounded inline-block" style="background:#059669;"></span>
        Ressources Humaines &amp; Paie
        <span class="w-5 h-0.5 rounded inline-block" style="background:#059669;"></span>
    </h2>
</div>
 
<div class="grid grid-cols-2 sm:grid-cols-4 gap-4">
 
    {{-- Catégories --}}
    <a href="{{ route('admin.rh.categories') }}"
        class="bg-white rounded-xl shadow-sm border border-gray-200 p-5 text-center hover:shadow-md hover:-translate-y-0.5 transition-all">
        <div class="w-11 h-11 rounded-xl flex items-center justify-center mx-auto mb-3" style="background:#d1fae5;">
            <svg class="w-5 h-5" style="color:#059669;" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M7 7h.01M7 3h5c.512 0 1.024.195 1.414.586l7 7a2 2 0 010 2.828l-7 7a2 2 0 01-2.828 0l-7-7A2 2 0 013 12V7a4 4 0 014-4z"/>
            </svg>
        </div>
        <p class="font-semibold text-gray-800 text-sm">Catégories</p>
        <p class="text-xs text-gray-400 mt-0.5">Salaires de base</p>
    </a>
 
    {{-- Indemnités --}}
    <a href="{{ route('admin.rh.indemnites') }}"
        class="bg-white rounded-xl shadow-sm border border-gray-200 p-5 text-center hover:shadow-md hover:-translate-y-0.5 transition-all">
        <div class="w-11 h-11 rounded-xl flex items-center justify-center mx-auto mb-3" style="background:#dcfce7;">
            <svg class="w-5 h-5" style="color:#16a34a;" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 6v6m0 0v6m0-6h6m-6 0H6"/>
            </svg>
        </div>
        <p class="font-semibold text-gray-800 text-sm">Indemnités</p>
        <p class="text-xs text-gray-400 mt-0.5">Éléments positifs</p>
    </a>
 
    {{-- Retenues --}}
    <a href="{{ route('admin.rh.retenues') }}"
        class="bg-white rounded-xl shadow-sm border border-gray-200 p-5 text-center hover:shadow-md hover:-translate-y-0.5 transition-all">
        <div class="w-11 h-11 rounded-xl flex items-center justify-center mx-auto mb-3" style="background:#fee2e2;">
            <svg class="w-5 h-5" style="color:#dc2626;" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M20 12H4"/>
            </svg>
        </div>
        <p class="font-semibold text-gray-800 text-sm">Retenues</p>
        <p class="text-xs text-gray-400 mt-0.5">Éléments négatifs</p>
    </a>
 
    {{-- Profils Salaires --}}
    <a href="{{ route('admin.rh.profils') }}"
        class="bg-white rounded-xl shadow-sm border border-gray-200 p-5 text-center hover:shadow-md hover:-translate-y-0.5 transition-all">
        <div class="w-11 h-11 rounded-xl flex items-center justify-center mx-auto mb-3" style="background:#e0f2fe;">
            <svg class="w-5 h-5" style="color:#0284c7;" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 14l6-6m-5.5.5h.01m4.99 5h.01M19 21V5a2 2 0 00-2-2H7a2 2 0 00-2 2v16l3.5-2 3.5 2 3.5-2 3.5 2z"/>
            </svg>
        </div>
        <p class="font-semibold text-gray-800 text-sm">Profils Salaires</p>
        <p class="text-xs text-gray-400 mt-0.5">Fiches de paie</p>
    </a>
 
</div>

        <!-- ==================== GESTION DES UTILISATEURS ==================== -->
        <section id="utilisateurs" class="mb-16 pt-10 border-t border-gray-200 scroll-mt-24">
            <div class="flex items-center mb-8">
                <div
                    class="flex-shrink-0 w-12 h-12 bg-gradient-to-br from-purple-500 to-purple-700 rounded-xl flex items-center justify-center mr-4 shadow-lg">
                    <svg class="w-6 h-6 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                            d="M17 20h5v-2a3 3 0 00-5.356-1.857M17 20H7m10 0v-2c0-.656-.126-1.283-.356-1.857M7 20H2v-2a3 3 0 015.356-1.857M7 20v-2c0-.656.126-1.283.356-1.857m0 0a5.002 5.002 0 019.288 0M15 7a3 3 0 11-6 0 3 3 0 016 0zm6 3a2 2 0 11-4 0 2 2 0 014 0zM7 10a2 2 0 11-4 0 2 2 0 014 0z">
                        </path>
                    </svg>
                </div>
                <div>
                    <h2 class="text-2xl font-bold text-gray-800">Gestion des Utilisateurs</h2>
                    <p class="text-gray-500 text-sm">Étudiants, personnel et préinscriptions</p>
                </div>
            </div>

            <div class="grid grid-cols-2 sm:grid-cols-3 lg:grid-cols-4 gap-5">
                <!-- Étudiants -->
                <a href="/admin/etudiant"
                    class="group bg-white rounded-xl shadow-md p-5 text-center transition transform hover:-translate-y-1 hover:shadow-lg border-t-4 border-purple-500">
                    <div class="flex justify-center mb-3">
                        <div
                            class="w-12 h-12 bg-purple-100 rounded-full flex items-center justify-center group-hover:bg-purple-200 transition">
                            <svg class="w-6 h-6 text-purple-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                    d="M12 4.354a4 4 0 110 5.292M15 21H3v-1a6 6 0 0112 0v1zm0 0h6v-1a6 6 0 00-9-5.197M13 7a4 4 0 11-8 0 4 4 0 018 0z">
                                </path>
                            </svg>
                        </div>
                    </div>
                    <h3 class="font-semibold text-gray-800 text-sm">Étudiants</h3>
                    <p class="text-xs text-gray-500 mt-1">Gestion des inscrits</p>
                </a>

                <!-- Personnel -->
                <a href="/admin/personnel"
                    class="group bg-white rounded-xl shadow-md p-5 text-center transition transform hover:-translate-y-1 hover:shadow-lg border-t-4 border-purple-500">
                    <div class="flex justify-center mb-3">
                        <div
                            class="w-12 h-12 bg-purple-100 rounded-full flex items-center justify-center group-hover:bg-purple-200 transition">
                            <svg class="w-6 h-6 text-purple-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                    d="M21 13.255A23.931 23.931 0 0112 15c-3.183 0-6.22-.62-9-1.745M16 6V4a2 2 0 00-2-2h-4a2 2 0 00-2 2v2m4 6h.01M5 20h14a2 2 0 002-2V8a2 2 0 00-2-2H5a2 2 0 00-2 2v10a2 2 0 002 2z">
                                </path>
                            </svg>
                        </div>
                    </div>
                    <h3 class="font-semibold text-gray-800 text-sm">Personnel</h3>
                    <p class="text-xs text-gray-500 mt-1">Enseignants & staff</p>
                </a>

                <!-- Préinscription -->
                <a href="/admin/preinscription"
                    class="group bg-white rounded-xl shadow-md p-5 text-center transition transform hover:-translate-y-1 hover:shadow-lg border-t-4 border-purple-500">
                    <div class="flex justify-center mb-3">
                        <div
                            class="w-12 h-12 bg-purple-100 rounded-full flex items-center justify-center group-hover:bg-purple-200 transition">
                            <svg class="w-6 h-6 text-purple-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                    d="M18 9v3m0 0v3m0-3h3m-3 0h-3m-2-5a4 4 0 11-8 0 4 4 0 018 0zM3 20a6 6 0 0112 0v1H3v-1z">
                                </path>
                            </svg>
                        </div>
                    </div>
                    <h3 class="font-semibold text-gray-800 text-sm">Préinscription</h3>
                    <p class="text-xs text-gray-500 mt-1">Futurs étudiants</p>
                </a>

                <!-- Présences -->
                <a href="/admin/presence"
                    class="group bg-white rounded-xl shadow-md p-5 text-center transition transform hover:-translate-y-1 hover:shadow-lg border-t-4 border-purple-500">
                    <div class="flex justify-center mb-3">
                        <div
                            class="w-12 h-12 bg-purple-100 rounded-full flex items-center justify-center group-hover:bg-purple-200 transition">
                            <svg class="w-6 h-6 text-purple-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                    d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z"></path>
                            </svg>
                        </div>
                    </div>
                    <h3 class="font-semibold text-gray-800 text-sm">Présences</h3>
                    <p class="text-xs text-gray-500 mt-1">Suivi d'assiduité</p>
                </a>
            </div>
        </section>

        <!-- ==================== VIE ÉTUDIANTE ==================== -->
        <section id="vie-etudiante" class="mb-16 pt-10 border-t border-gray-200 scroll-mt-24">
            <div class="flex items-center mb-8">
                <div
                    class="flex-shrink-0 w-12 h-12 bg-gradient-to-br from-blue-500 to-blue-700 rounded-xl flex items-center justify-center mr-4 shadow-lg">
                    <svg class="w-6 h-6 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                            d="M4.26 10.147a60.436 60.436 0 00-.491 6.347A48.627 48.627 0 0112 20.904a48.627 48.627 0 018.232-4.41 60.46 60.46 0 00-.491-6.347m-15.482 0a50.57 50.57 0 00-2.658-.813A59.905 59.905 0 0112 3.493a59.902 59.902 0 0110.399 5.84c-.896.248-1.783.52-2.658.814m-15.482 0A50.697 50.697 0 0112 13.489a50.702 50.702 0 017.74-3.342M6.75 15a.75.75 0 100-1.5.75.75 0 000 1.5zm0 0v-3.675A55.378 55.378 0 0112 8.443m-7.007 11.55A5.981 5.981 0 006.75 15.75v-1.5">
                        </path>
                    </svg>
                </div>
                <div>
                    <h2 class="text-2xl font-bold text-gray-800">Vie Étudiante</h2>
                    <p class="text-gray-500 text-sm">Restaurant, bibliothèque et services</p>
                </div>
            </div>

            <div class="grid grid-cols-2 sm:grid-cols-3 lg:grid-cols-4 gap-5">
                <!-- Restaurant -->
                <a href="/admin/menu"
                    class="group bg-white rounded-xl shadow-md p-5 text-center transition transform hover:-translate-y-1 hover:shadow-lg border-t-4 border-blue-500">
                    <div class="flex justify-center mb-3">
                        <div
                            class="w-12 h-12 bg-blue-100 rounded-full flex items-center justify-center group-hover:bg-blue-200 transition">
                            <svg class="w-6 h-6 text-blue-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                    d="M12 6v6m0 0v6m0-6h6m-6 0H6"></path>
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                    d="M3 3h2l.4 2M7 13h10l4-8H5.4M7 13L5.4 5M7 13l-2.293 2.293c-.63.63-.184 1.707.707 1.707H17m0 0a2 2 0 100 4 2 2 0 000-4zm-8 2a2 2 0 11-4 0 2 2 0 014 0z">
                                </path>
                            </svg>
                        </div>
                    </div>
                    <h3 class="font-semibold text-gray-800 text-sm">Restaurant</h3>
                    <p class="text-xs text-gray-500 mt-1">Menus & repas</p>
                </a>

                <!-- Bibliothèque -->
                <a href="/admin/bibliotheque"
                    class="group bg-white rounded-xl shadow-md p-5 text-center transition transform hover:-translate-y-1 hover:shadow-lg border-t-4 border-blue-500">
                    <div class="flex justify-center mb-3">
                        <div
                            class="w-12 h-12 bg-blue-100 rounded-full flex items-center justify-center group-hover:bg-blue-200 transition">
                            <svg class="w-6 h-6 text-blue-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                    d="M12 6.253v13m0-13C10.832 5.477 9.246 5 7.5 5S4.168 5.477 3 6.253v13C4.168 18.477 5.754 18 7.5 18s3.332.477 4.5 1.253m0-13C13.168 5.477 14.754 5 16.5 5c1.747 0 3.332.477 4.5 1.253v13C19.832 18.477 18.246 18 16.5 18c-1.747 0-3.332.477-4.5 1.253">
                                </path>
                            </svg>
                        </div>
                    </div>
                    <h3 class="font-semibold text-gray-800 text-sm">Bibliothèque</h3>
                    <p class="text-xs text-gray-500 mt-1">Livres & emprunts</p>
                </a>

                <!-- Support -->
                <a href="/admin/support"
                    class="group bg-white rounded-xl shadow-md p-5 text-center transition transform hover:-translate-y-1 hover:shadow-lg border-t-4 border-blue-500">
                    <div class="flex justify-center mb-3">
                        <div
                            class="w-12 h-12 bg-blue-100 rounded-full flex items-center justify-center group-hover:bg-blue-200 transition">
                            <svg class="w-6 h-6 text-blue-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                    d="M18.364 5.636l-3.536 3.536m0 5.656l3.536 3.536M9.172 9.172L5.636 5.636m3.536 9.192l-3.536 3.536M21 12a9 9 0 11-18 0 9 9 0 0118 0zm-5 0a4 4 0 11-8 0 4 4 0 018 0z">
                                </path>
                            </svg>
                        </div>
                    </div>
                    <h3 class="font-semibold text-gray-800 text-sm">Support</h3>
                    <p class="text-xs text-gray-500 mt-1">Requêtes & aide</p>
                </a>
            </div>
        </section>

        <!-- ==================== COMMUNICATION ==================== -->
        <section id="communication" class="mb-16 pt-10 border-t border-gray-200 scroll-mt-24">
            <div class="flex items-center mb-8">
                <div
                    class="flex-shrink-0 w-12 h-12 bg-green-500 rounded-xl flex items-center justify-center mr-4 shadow-lg">
                    <svg class="w-6 h-6 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                            d="M8 12h.01M12 12h.01M16 12h.01M21 12c0 4.418-4.03 8-9 8a9.863 9.863 0 01-4.255-.949L3 20l1.395-3.72C3.512 15.042 3 13.574 3 12c0-4.418 4.03-8 9-8s9 3.582 9 8z">
                        </path>
                    </svg>
                </div>
                <div>
                    <h2 class="text-2xl font-bold text-gray-800">Communication</h2>
                    <p class="text-gray-500 text-sm">Annonces, notifications et emails</p>
                </div>
            </div>

            <div class="grid grid-cols-2 sm:grid-cols-3 lg:grid-cols-4 gap-5">
                <!-- Annonces -->
                <a href="/admin/annonce"
                    class="group bg-white rounded-xl shadow-md p-5 text-center transition transform hover:-translate-y-1 hover:shadow-lg border-t-4 border-green-500">
                    <div class="flex justify-center mb-3">
                        <div
                            class="w-12 h-12 bg-green-100 rounded-full flex items-center justify-center group-hover:bg-green-200 transition">
                            <svg class="w-6 h-6 text-green-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                    d="M11 5.882V19.24a1.76 1.76 0 01-3.417.592l-2.147-6.15M18 13a3 3 0 100-6M5.436 13.683A4.001 4.001 0 017 6h1.832c4.1 0 7.625-1.234 9.168-3v14c-1.543-1.766-5.067-3-9.168-3H7a3.988 3.988 0 01-1.564-.317z">
                                </path>
                            </svg>
                        </div>
                    </div>
                    <h3 class="font-semibold text-gray-800 text-sm">Annonces</h3>
                    <p class="text-xs text-gray-500 mt-1">Tableau d'affichage</p>
                </a>

                <!-- Notifications -->
                <a href="/admin/notification"
                    class="group bg-white rounded-xl shadow-md p-5 text-center transition transform hover:-translate-y-1 hover:shadow-lg border-t-4 border-green-500">
                    <div class="flex justify-center mb-3">
                        <div
                            class="w-12 h-12 bg-green-100 rounded-full flex items-center justify-center group-hover:bg-green-200 transition">
                            <svg class="w-6 h-6 text-green-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                    d="M15 17h5l-1.405-1.405A2.032 2.032 0 0118 14.158V11a6.002 6.002 0 00-4-5.659V5a2 2 0 10-4 0v.341C7.67 6.165 6 8.388 6 11v3.159c0 .538-.214 1.055-.595 1.436L4 17h5m6 0v1a3 3 0 11-6 0v-1m6 0H9">
                                </path>
                            </svg>
                        </div>
                    </div>
                    <h3 class="font-semibold text-gray-800 text-sm">Notifications</h3>
                    <p class="text-xs text-gray-500 mt-1">Alertes système</p>
                </a>

                <!-- Articles -->
                <a href="/admin/article"
                    class="group bg-white rounded-xl shadow-md p-5 text-center transition transform hover:-translate-y-1 hover:shadow-lg border-t-4 border-green-500">
                    <div class="flex justify-center mb-3">
                        <div
                            class="w-12 h-12 bg-green-100 rounded-full flex items-center justify-center group-hover:bg-green-200 transition">
                            <svg class="w-6 h-6 text-green-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                    d="M19 20H5a2 2 0 01-2-2V6a2 2 0 012-2h10a2 2 0 012 2v1m2 13a2 2 0 01-2-2V7m2 13a2 2 0 002-2V9a2 2 0 00-2-2h-2m-4-3H9M7 16h6M7 8h6v4H7V8z">
                                </path>
                            </svg>
                        </div>
                    </div>
                    <h3 class="font-semibold text-gray-800 text-sm">Articles</h3>
                    <p class="text-xs text-gray-500 mt-1">Publications & blog</p>
                </a>

                <!-- Email -->
                <a href="https://node31-ca.n0c.com/webmail/" target="_blank"
                    class="group bg-white rounded-xl shadow-md p-5 text-center transition transform hover:-translate-y-1 hover:shadow-lg border-t-4 border-green-500">
                    <div class="flex justify-center mb-3">
                        <div
                            class="w-12 h-12 bg-green-100 rounded-full flex items-center justify-center group-hover:bg-green-200 transition">
                            <svg class="w-6 h-6 text-green-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                    d="M3 8l7.89 5.26a2 2 0 002.22 0L21 8M5 19h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v10a2 2 0 002 2z">
                                </path>
                            </svg>
                        </div>
                    </div>
                    <h3 class="font-semibold text-gray-800 text-sm">Email Pro</h3>
                    <p class="text-xs text-gray-500 mt-1">Webmail externe</p>
                </a>
            </div>
        </section>

        <!-- ==================== INFRASTRUCTURE ==================== -->
        <section id="infrastructure" class="mb-16 pt-10 border-t border-gray-200 scroll-mt-24">
            <div class="flex items-center mb-8">
                <div
                    class="flex-shrink-0 w-12 h-12 bg-orange-500 rounded-xl flex items-center justify-center mr-4 shadow-lg">
                    <svg class="w-6 h-6 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                            d="M19 21V5a2 2 0 00-2-2H7a2 2 0 00-2 2v16m14 0h2m-2 0h-5m-9 0H3m2 0h5M9 7h1m-1 4h1m4-4h1m-1 4h1m-5 10v-5a1 1 0 011-1h2a1 1 0 011 1v5m-4 0h4">
                        </path>
                    </svg>
                </div>
                <div>
                    <h2 class="text-2xl font-bold text-gray-800">Infrastructure</h2>
                    <p class="text-gray-500 text-sm">Salles, sections et locaux</p>
                </div>
            </div>

            <div class="grid grid-cols-2 sm:grid-cols-3 lg:grid-cols-4 gap-5">
                <!-- Salles -->
                <a href="/admin/salle"
                    class="group bg-white rounded-xl shadow-md p-5 text-center transition transform hover:-translate-y-1 hover:shadow-lg border-t-4 border-orange-500">
                    <div class="flex justify-center mb-3">
                        <div
                            class="w-12 h-12 bg-orange-100 rounded-full flex items-center justify-center group-hover:bg-orange-200 transition">
                            <svg class="w-6 h-6 text-orange-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                    d="M8 14v3m4-3v3m4-3v3M3 21h18M3 10h18M3 7l9-4 9 4M4 10h16v11H4V10z"></path>
                            </svg>
                        </div>
                    </div>
                    <h3 class="font-semibold text-gray-800 text-sm">Salles</h3>
                    <p class="text-xs text-gray-500 mt-1">Classes & matériel</p>
                </a>

                <!-- Section -->
                <a href="/admin/section"
                    class="group bg-white rounded-xl shadow-md p-5 text-center transition transform hover:-translate-y-1 hover:shadow-lg border-t-4 border-orange-500">
                    <div class="flex justify-center mb-3">
                        <div
                            class="w-12 h-12 bg-orange-100 rounded-full flex items-center justify-center group-hover:bg-orange-200 transition">
                            <svg class="w-6 h-6 text-orange-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                    d="M4 6a2 2 0 012-2h2a2 2 0 012 2v2a2 2 0 01-2 2H6a2 2 0 01-2-2V6zM14 6a2 2 0 012-2h2a2 2 0 012 2v2a2 2 0 01-2 2h-2a2 2 0 01-2-2V6zM4 16a2 2 0 012-2h2a2 2 0 012 2v2a2 2 0 01-2 2H6a2 2 0 01-2-2v-2zM14 16a2 2 0 012-2h2a2 2 0 012 2v2a2 2 0 01-2 2h-2a2 2 0 01-2-2v-2z">
                                </path>
                            </svg>
                        </div>
                    </div>
                    <h3 class="font-semibold text-gray-800 text-sm">Sections</h3>
                    <p class="text-xs text-gray-500 mt-1">Organisation</p>
                </a>
            </div>
        </section>

        <!-- ==================== ADMINISTRATION ==================== -->
        <section id="administration" class="mb-16 pt-10 border-t border-gray-200 scroll-mt-24">
            <div class="flex items-center mb-8">
                <div
                    class="flex-shrink-0 w-12 h-12 bg-gray-500 rounded-xl flex items-center justify-center mr-4 shadow-lg">
                    <svg class="w-6 h-6 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                            d="M10.325 4.317c.426-1.756 2.924-1.756 3.35 0a1.724 1.724 0 002.573 1.066c1.543-.94 3.31.826 2.37 2.37a1.724 1.724 0 001.065 2.572c1.756.426 1.756 2.924 0 3.35a1.724 1.724 0 00-1.066 2.573c.94 1.543-.826 3.31-2.37 2.37a1.724 1.724 0 00-2.572 1.065c-.426 1.756-2.924 1.756-3.35 0a1.724 1.724 0 00-2.573-1.066c-1.543.94-3.31-.826-2.37-2.37a1.724 1.724 0 00-1.065-2.572c-1.756-.426-1.756-2.924 0-3.35a1.724 1.724 0 001.066-2.573c-.94-1.543.826-3.31 2.37-2.37.996.608 2.296.07 2.572-1.065z">
                        </path>
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                            d="M15 12a3 3 0 11-6 0 3 3 0 016 0z"></path>
                    </svg>
                </div>
                <div>
                    <h2 class="text-2xl font-bold text-gray-800">Administration</h2>
                    <p class="text-gray-500 text-sm">Paramètres, finances et configuration</p>
                </div>
            </div>

            <div class="grid grid-cols-2 sm:grid-cols-3 lg:grid-cols-4 gap-5">
                <!-- Paramètres -->
                <a href="/admin/configuration"
                    class="group bg-white rounded-xl shadow-md p-5 text-center transition transform hover:-translate-y-1 hover:shadow-lg border-t-4 border-gray-500">
                    <div class="flex justify-center mb-3">
                        <div
                            class="w-12 h-12 bg-gray-100 rounded-full flex items-center justify-center group-hover:bg-gray-200 transition">
                            <svg class="w-6 h-6 text-gray-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                    d="M12 6V4m0 2a2 2 0 100 4m0-4a2 2 0 110 4m-6 8a2 2 0 100-4m0 4a2 2 0 110-4m0 4v2m0-6V4m6 6v10m6-2a2 2 0 100-4m0 4a2 2 0 110-4m0 4v2m0-6V4">
                                </path>
                            </svg>
                        </div>
                    </div>
                    <h3 class="font-semibold text-gray-800 text-sm">Paramètres</h3>
                    <p class="text-xs text-gray-500 mt-1">Configuration app</p>
                </a>

                <!-- Finances -->
                <a href="/admin/finance"
                    class="group bg-white rounded-xl shadow-md p-5 text-center transition transform hover:-translate-y-1 hover:shadow-lg border-t-4 border-gray-500">
                    <div class="flex justify-center mb-3">
                        <div
                            class="w-12 h-12 bg-gray-100 rounded-full flex items-center justify-center group-hover:bg-gray-200 transition">
                            <svg class="w-6 h-6 text-gray-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                    d="M12 8c-1.657 0-3 .895-3 2s1.343 2 3 2 3 .895 3 2-1.343 2-3 2m0-8c1.11 0 2.08.402 2.599 1M12 8V7m0 1v8m0 0v1m0-1c-1.11 0-2.08-.402-2.599-1M21 12a9 9 0 11-18 0 9 9 0 0118 0z">
                                </path>
                            </svg>
                        </div>
                    </div>
                    <h3 class="font-semibold text-gray-800 text-sm">Finances</h3>
                    <p class="text-xs text-gray-500 mt-1">Transactions</p>
                </a>
            </div>
        </section>

    </div>
    @endvolt
</x-layouts.app>