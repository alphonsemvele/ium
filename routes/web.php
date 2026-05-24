<?php

use App\Http\Controllers\ProfileController;
use Illuminate\Support\Facades\Route;
use Spatie\RouteDiscovery\Discovery\Discover;
use App\Mail\notifMail;
use Illuminate\Support\Facades\Mail;



 Discover::controllers()->in(app_path('Http/Controllers'));

Route::post('/preinscription', ['App\Http\Controllers\Pages\PreinscriptionController', 'logout'])->name('preinscription.index');


// Route::view('/', 'ism')->name('ism');
Route::post('/', ['App\Http\Controllers\vitrineController', 'index'])->name('ism');
Route::get('/', ['App\Http\Controllers\vitrineController', 'index'])->name('ism');

Route::get('/articles/{id}', ['App\Http\Controllers\vitrineController', 'show'])->name('articles.show');


Route::view('/ifpm', 'ifpm')->name('ifpm');
Route::post('/logout', ['App\Http\Controllers\AuthController', 'logout'])->name('logout');

// Route::get('/', function () {
//     return view('welcome');
// });
Route::get('/specialite/examens/notes/{examen}/{cours}', function ($examen, $cours) {
    return view('pages.specialite.examens.notes', [
        'examenId' => $examen,
        'coursId'  => $cours,
    ]);
})->name('specialite.examens.notes')->middleware(['auth', 'verified']);

Route::get('/send-test-mail', function () {

$subject = "Email Test";
$content = "Chers administrateurs, de la plateforme ERP  ISM NDAZOA. Nous sommes ravis de constater que notre système de messagerie fonctionne à merveille. Vous revevrez desormais les notifications sur des requêtes venant de toute la plateforme. Merci de patienter";

 Mail::to('elvinyondoua@gmail.com')->send(new notifMail($subject,$content));
    return 'Email sent!';
});
// Route::get('/dashboard', function () {
//     return view('dashboard');
// })->middleware(['auth', 'verified'])->name('dashboard');

// Route::middleware('auth')->group(function () {
//     Route::get('/profile', [ProfileController::class, 'edit'])->name('profile.edit');
//     Route::patch('/profile', [ProfileController::class, 'update'])->name('profile.update');
//     Route::delete('/profile', [ProfileController::class, 'destroy'])->name('profile.destroy');
// });

require __DIR__.'/auth.php';
