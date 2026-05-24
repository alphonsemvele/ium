<x-guest-layout>
    <!-- Message d'erreur pour compte non validé -->
    @if (session('error'))
        <div class="mb-4 p-4 rounded-lg" style="background-color: #fee2e2; border: 1px solid #ef4444; color: #991b1b;">
            <div class="flex items-center">
                <svg class="w-5 h-5 mr-2" style="color: #ef4444;" fill="currentColor" viewBox="0 0 20 20">
                    <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zM8.707 7.293a1 1 0 00-1.414 1.414L8.586 10l-1.293 1.293a1 1 0 101.414 1.414L10 11.414l1.293 1.293a1 1 0 001.414-1.414L11.414 10l1.293-1.293a1 1 0 00-1.414-1.414L10 8.586 8.707 7.293z" clip-rule="evenodd"/>
                </svg>
                <span style="font-weight: 500;">{{ session('error') }}</span>
            </div>
        </div>
    @endif

    <!-- Message de succès -->
    @if (session('success'))
        <div class="mb-4 p-4 rounded-lg" style="background-color: #d1fae5; border: 1px solid #10b981; color: #065f46;">
            <div class="flex items-center">
                <svg class="w-5 h-5 mr-2" style="color: #10b981;" fill="currentColor" viewBox="0 0 20 20">
                    <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z" clip-rule="evenodd"/>
                </svg>
                <span style="font-weight: 500;">{{ session('success') }}</span>
            </div>
        </div>
    @endif

    <!-- Session Status -->
    <x-auth-session-status class="mb-4" :status="session('status')" />

    <!-- Loading Overlay -->
    <div id="loading-overlay" class="hidden fixed inset-0 z-50" style="background-color: rgba(0, 0, 0, 0.5);">
        <div class="flex items-center justify-center h-full">
            <div class="text-center" style="background-color: white; padding: 2rem; border-radius: 0.5rem; box-shadow: 0 10px 15px -3px rgba(0, 0, 0, 0.1);">
                <div class="animate-spin rounded-full h-16 w-16 border-b-4 mx-auto mb-4" style="border-color: #4F46E5;"></div>
                <p class="text-lg font-semibold" style="color: #4F46E5;">Connexion en cours...</p>
                <p class="text-sm mt-2" style="color: #6B7280;">Veuillez patienter</p>
            </div>
        </div>
    </div>

    <form method="POST" action="{{ route('login') }}" id="login-form">
        @csrf

        <!-- Email Address -->
        <div>
            <x-input-label for="email" :value="__('Email')" />
            <x-text-input id="email" class="block mt-1 w-full" type="email" name="email" :value="old('email')" required autofocus autocomplete="username" />
            <x-input-error :messages="$errors->get('email')" class="mt-2" />
        </div>

        <!-- Password -->
        <div class="mt-4">
            <x-input-label for="password" :value="__('Password')" />
            <x-text-input id="password" class="block mt-1 w-full"
                            type="password"
                            name="password"
                            required autocomplete="current-password" />
            <x-input-error :messages="$errors->get('password')" class="mt-2" />
        </div>

        <!-- Remember Me -->
        <div class="block mt-4">
            <label for="remember_me" class="inline-flex items-center">
                <input id="remember_me" type="checkbox" class="rounded border-gray-300 text-indigo-600 shadow-sm focus:ring-indigo-500" name="remember">
                <span class="ms-2 text-sm text-gray-600">{{ __('Remember me') }}</span>
            </label>
        </div>

        <div class="flex items-center justify-end mt-4">
            @if (Route::has('password.request'))
                <a class="underline text-sm text-gray-600 hover:text-gray-900 rounded-md focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500" href="{{ route('password.request') }}">
                    {{ __('Forgot your password?') }}
                </a>
            @endif

            <x-primary-button class="ms-3" id="submit-btn">
                {{ __('Log in') }}
            </x-primary-button>
        </div>
    </form>

    <script>
        // Gestion du chargement lors de la soumission du formulaire
        document.getElementById('login-form').addEventListener('submit', function(e) {
            // Afficher l'overlay de chargement
            document.getElementById('loading-overlay').classList.remove('hidden');
            
            // Désactiver le bouton de soumission
            const submitBtn = document.getElementById('submit-btn');
            submitBtn.disabled = true;
            submitBtn.style.opacity = '0.6';
            submitBtn.style.cursor = 'not-allowed';
        });
    </script>
</x-guest-layout>