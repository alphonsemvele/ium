<?php

namespace App\Http\Controllers;

use App\Models\PaiementSalaire;
use Barryvdh\DomPDF\Facade\Pdf;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class BulletinController extends Controller
{
    /**
     * Télécharger le bulletin PDF d'un paiement
     */
    public function telecharger(int $id)
    {
        $paiement = PaiementSalaire::with([
            'employe',
            'profil.indemnites',
            'profil.retenues',
            'echelon',
            'validePar',
            'payePar',
        ])->findOrFail($id);

        // Seul l'admin ou l'employé concerné peut télécharger
        $user = Auth::user();
        if ($user->role !== 'admin' && $user->id !== $paiement->user_id) {
            abort(403);
        }

        $moisNoms = [
            1 => 'Janvier', 2 => 'Février',   3 => 'Mars',
            4 => 'Avril',   5 => 'Mai',        6 => 'Juin',
            7 => 'Juillet', 8 => 'Août',       9 => 'Septembre',
            10 => 'Octobre',11 => 'Novembre',  12 => 'Décembre',
        ];

        $detail     = $paiement->detail_json ?? [];
        $indemnites = $detail['indemnites'] ?? [];
        $retenues   = $detail['retenues']   ?? [];
        $moisNom    = $moisNoms[$paiement->mois] ?? '';

        // Logo en base64
        $logoPath = public_path('images/logo.png');
        $logoB64  = file_exists($logoPath)
            ? 'data:image/png;base64,' . base64_encode(file_get_contents($logoPath))
            : null;

        $pdf = Pdf::loadView('pdf.bulletin', compact(
            'paiement', 'indemnites', 'retenues', 'moisNom', 'logoB64'
        ))->setPaper('a4', 'portrait');

        $filename = 'Bulletin_' .
            str_replace(' ', '_', strtoupper($paiement->employe->name)) .
            '_' . $moisNom . '_' . $paiement->annee . '.pdf';

        return $pdf->download($filename);
    }

    /**
     * Télécharger plusieurs bulletins en un seul PDF (batch)
     */
    /**
     * Prévisualiser le bulletin dans le navigateur (stream inline)
     */
    public function previsualiser(int $id)
    {
        $paiement = PaiementSalaire::with([
            'employe', 'profil', 'echelon', 'validePar', 'payePar',
        ])->findOrFail($id);

        $user = Auth::user();
        if ($user->role !== 'admin' && $user->id !== $paiement->user_id) {
            abort(403);
        }

        $moisNoms = [
            1=>'Janvier',2=>'Février',3=>'Mars',4=>'Avril',5=>'Mai',6=>'Juin',
            7=>'Juillet',8=>'Août',9=>'Septembre',10=>'Octobre',11=>'Novembre',12=>'Décembre',
        ];

        $detail     = $paiement->detail_json ?? [];
        $indemnites = $detail['indemnites'] ?? [];
        $retenues   = $detail['retenues']   ?? [];
        $moisNom    = $moisNoms[$paiement->mois] ?? '';
        $logoB64    = null;

        $pdf = Pdf::loadView('pdf.bulletin', compact(
            'paiement', 'indemnites', 'retenues', 'moisNom', 'logoB64'
        ))->setPaper('a4', 'portrait');

        return $pdf->stream('bulletin_preview.pdf');
    }

    public function batch(Request $request)
    {
        $ids = $request->input('ids', []);
        if (empty($ids)) abort(400);

        $paiements = PaiementSalaire::with([
            'employe', 'profil', 'echelon', 'validePar', 'payePar',
        ])->whereIn('id', $ids)->orderBy('user_id')->get();

        $moisNoms = [
            1=>'Janvier',2=>'Février',3=>'Mars',4=>'Avril',5=>'Mai',6=>'Juin',
            7=>'Juillet',8=>'Août',9=>'Septembre',10=>'Octobre',11=>'Novembre',12=>'Décembre',
        ];

        $logoPath = public_path('images/logo.png');
        $logoB64  = file_exists($logoPath)
            ? 'data:image/png;base64,' . base64_encode(file_get_contents($logoPath))
            : null;

        $pdf = Pdf::loadView('pdf.bulletins-batch', compact('paiements', 'moisNoms', 'logoB64'))
            ->setPaper('a4', 'portrait');

        return $pdf->download('Bulletins_' . now()->format('Y-m') . '.pdf');
    }
}