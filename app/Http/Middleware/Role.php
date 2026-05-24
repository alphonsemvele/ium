<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Symfony\Component\HttpFoundation\Response;

class Role
{
   public function handle(Request $request, Closure $next): Response
{
    $user = Auth::user();

    if (!$user) {
        return $next($request);
    }

    $redirects = [
        'admin' => '/admin',
        'coordonnateur' => '/filiere',
        'enseignant' => '/specialite',
        'etudiant' => '/dashboard',
    ];

    if (isset($redirects[$user->role])) {

        $target = $redirects[$user->role];

        // ✅ Autorise la route principale + toutes les sous-routes
        if (!$request->is(ltrim($target, '/') . '*')) {
            return redirect($target)
                ->with('success', 'Bienvenue dans votre espace');
        }

        return $next($request);
    }

    return redirect('/')
        ->with('error', 'Rôle non reconnu.');
}

}
