<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;

class User extends Authenticatable
{
    use HasFactory, Notifiable;

    protected $fillable = [
        'name',
        'lastname',
        'contact',
        'whatsapp',
        'email',
        'role',
        'matricule',
        'filiere_id',
        'specialite_id',
        'cycle_id',
        'picture',
        'password',
        'region_id',
        'department_id',
        'arrondissement_id',
        'status',
        'father_name',
        'father_contact',
        'mother_name',
        'mother_contact',
        'poste',
        'entite',
        'photo',
        'cropped_photo',
        'section_id',
        'departement_id',
        'profil_salaire_id',
        'categorie_rh_id',
        'echelon_id',
    ];

    protected $hidden = [
        'password',
        'remember_token',
    ];

    protected function casts(): array
    {
        return [
            'email_verified_at' => 'datetime',
            'password'          => 'hashed',
        ];
    }

    public function filiere()
    {
        return $this->belongsTo(Filiere::class, 'filiere_id');
    }

    public function specialite()
    {
        return $this->belongsTo(Specialite::class, 'specialite_id');
    }

    public function department()
    {
        return $this->belongsTo(Department::class, 'department_id');
    }

    public function region()
    {
        return $this->belongsTo(Region::class, 'region_id');
    }

    public function cycle()
    {
        return $this->belongsTo(Cycle::class, 'cycle_id');
    }

    public function section()
    {
        return $this->belongsTo(Section::class, 'section_id');
    }

    public function arrondissement()
    {
        return $this->belongsTo(Arrondissement::class, 'arrondissement_id');
    }

    public function supports()
    {
        return $this->hasMany(Support::class, 'user_id');
    }

    public function notes()
    {
        return $this->hasMany(Note::class, 'etudiant_id');
    }

    public function profilSalaire()
    {
        return $this->belongsTo(ProfilSalaire::class, 'profil_salaire_id');
    }

    public function categorieRh()
    {
        return $this->belongsTo(CategorieRh::class, 'categorie_rh_id');
    }

    public function echelon()
    {
        return $this->belongsTo(Echelon::class, 'echelon_id');
    }
}