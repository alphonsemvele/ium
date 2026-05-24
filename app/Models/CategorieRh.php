<?php
// ─── App\Models\CategorieRh.php ───────────────────────────────────────────────
namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;

class CategorieRh extends Model
{
    protected $table = 'categories_rh';

    protected $fillable = ['libelle', 'salaire_base', 'description', 'actif'];

    protected $casts = ['salaire_base' => 'float', 'actif' => 'boolean'];

    public function employes(): HasMany
    {
        return $this->hasMany(User::class, 'categorie_rh_id');
    }

    public function profilSalaires(): HasMany
    {
        return $this->hasMany(ProfilSalaire::class, 'categorie_rh_id');
    }

    public function getSalaireFormateAttribute(): string
    {
        return number_format($this->salaire_base, 0, ',', ' ') . ' FCFA';
    }

    public function getNbEmployesAttribute(): int
    {
        return $this->employes()->count();
    }
}