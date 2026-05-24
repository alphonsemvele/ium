<?php
// ─── App\Models\ProfilSalaire.php ─────────────────────────────────────────────
namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;
use Illuminate\Database\Eloquent\Relations\HasMany;

class ProfilSalaire extends Model
{
    protected $fillable = ['nom', 'description', 'categorie_rh_id', 'actif'];
    protected $casts    = ['actif' => 'boolean'];

    public function categorie(): BelongsTo
    {
        return $this->belongsTo(CategorieRh::class, 'categorie_rh_id');
    }

    public function employes(): HasMany
    {
        return $this->hasMany(User::class, 'profil_salaire_id');
    }

    public function indemnites(): BelongsToMany
    {
        return $this->belongsToMany(Indemnite::class, 'profil_salaire_indemnite')
            ->withPivot('type_calcul', 'value')
            ->withTimestamps();
    }

    public function retenues(): BelongsToMany
    {
        return $this->belongsToMany(Retenue::class, 'profil_salaire_retenue')
            ->withPivot('type_calcul', 'value')
            ->withTimestamps();
    }

    // ── Calculs ───────────────────────────────────────────────────────────────

    public function getSalaireBase(): float
    {
        return $this->categorie ? (float) $this->categorie->salaire_base : 0;
    }

    public function calculerMontant($item, float $salaireBase): float
    {
        if ($item->pivot->type_calcul === 'fixe') {
            return (float) $item->pivot->value;
        }
        return round($salaireBase * (float) $item->pivot->value / 100, 2);
    }

    public function getTotalIndemnitesAttribute(): float
    {
        $base = $this->getSalaireBase();
        return $this->indemnites->sum(fn($i) => $this->calculerMontant($i, $base));
    }

    public function getTotalRetenuesAttribute(): float
    {
        $base = $this->getSalaireBase();
        return $this->retenues->sum(fn($r) => $this->calculerMontant($r, $base));
    }

    public function getSalaireBrutAttribute(): float
    {
        return $this->getSalaireBase() + $this->total_indemnites;
    }

    public function getSalaireNetAttribute(): float
    {
        return $this->salaire_brut - $this->total_retenues;
    }
}