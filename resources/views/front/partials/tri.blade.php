<label for="category_id">Categories</label>
<select name="category_id" id="category_id" onchange="window.location.href=this.value">
    <option value="">non catégorisé</option>
    <option value="{{url()}}">non catégorisé</option>

</select>

<div id="tri">
    <span>Trier par:</span>
    <a href="{{url('home', 'bydate')}}">date</a>
    <a href="{{url('home', 'byname')}}">nom</a>
    <a href="{{url('home', 'byprice')}}">prix</a>
    <a href="{{url('home', 'byscore')}}">popularité</a>
</div>