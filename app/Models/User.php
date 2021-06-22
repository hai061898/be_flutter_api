<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Illuminate\Database\Eloquent\Collection;
use Illuminate\Database\Eloquent\Model;

/**
 * Class User
 * 
 * @property int $id
 * @property string $fullname
 * @property string $username
 * @property string $password
 * @property boolean $image
 * @property int $activated
 * 
 * @property Collection|Employee[] $employees
 * @property Collection|Schedule[] $schedules
 *
 * @package App\Models
 */
class User extends Model
{
	protected $table = 'users';
	public $timestamps = false;

	protected $casts = [
		'image' => 'boolean',
		'activated' => 'int'
	];

	protected $hidden = [
		'password'
	];

	protected $fillable = [
		'fullname',
		'username',
		'password',
		'image',
		'activated'
	];

	public function employees()
	{
		return $this->hasMany(Employee::class);
	}

	public function schedules()
	{
		return $this->hasMany(Schedule::class);
	}
}
