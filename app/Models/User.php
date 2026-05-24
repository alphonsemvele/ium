<?php
namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;

class User extends Authenticatable
{
    use HasFactory, Notifiable;

    /**
     * The attributes that are mass assignable.
     *
     * @var list<string>
     */
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
         "father_name",
        "father_contact",
        "mother_name",
        "mother_contact",
        "poste",
        "entite",
        "photo",
        "cropped_photo",
        "section_id",
        "departement_id"


    ];

    /**
     * The attributes that should be hidden for serialization.
     *
     * @var list<string>
     */
    protected $hidden = [
        'password',
        'remember_token',
    ];

    /**
     * Get the attributes that should be cast.
     *
     * @return array<string, string>
     */
    protected function casts(): array
    {
        return [
            'email_verified_at' => 'datetime',
            'password'          => 'hashed',
        ];
    }

    /**
     * Define the relationship with Filiere.
     */
    public function filiere()
    {
        return $this->belongsTo(Filiere::class, 'filiere_id');
    }

    /**
     * Define the relationship with Specialite.
     */
    public function specialite()
    {
        return $this->belongsTo(Specialite::class, 'specialite_id');
    }
    public function department()
    {
        return $this->belongsTo(Department::class, 'department_id');
    }
    /**
     * Define the relationship with Region.
     */
    public function region()
    {
        return $this->belongsTo(Region::class, 'region_id');
    }

    /**
     * Define the relationship with Department.
     */
    public function cycle()
    {
        return $this->belongsTo(Cycle::class, 'cycle_id');
    }
    
     public function section()
    {
        return $this->belongsTo(Section::class, 'section_id');
    }

    /**
     * Define the relationship with Arrondissement.
     */
    public function arrondissement()
    {
        return $this->belongsTo(Arrondissement::class, 'arrondissement_id');
    }
    // Nouvelle relation vers Support
    public function supports()
    {
        return $this->hasMany(Support::class, 'user_id');
    }

    public function notes()
{
    return $this->hasMany(Note::class, 'etudiant_id');
}
}
