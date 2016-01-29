<?php

namespace App\Http\Requests;

use App\Http\Requests\Request;

class ProductRequest extends Request
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return true; // par defaut false mais on fait pas de verif car deja authentifié
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        return [
            'name'          => 'required|string|max:255',
            'slug'          => 'string',
            'category_id'   => 'integer',
            'price'         => 'required|numeric',
            'quantity'      => 'integer',
            'status'        => 'in:opened,closed',
            'published_at'  => 'required|date_format:Y-m-j',
            'thumbnail'     => 'image|max:3000',
            'delete_img'    => 'in:1'
        ];
    }
}
