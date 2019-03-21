<form name="searchreplace" class="search-form" method="GET">
    <fieldset class="search-form__fieldset">
        <label>Query</label>
        <input name="path" type="text" placeholder="Path" value="${param.path}" required="true" />
        <input name="property" type="text" placeholder="Property" value="${param.property}" />
        <select name="property_operation">
            <option value="equals" ${param.property_operation == 'equals' ? 'selected' : ''}>equals</option>
            <%--<option value="unequals" ${param.property_operation == 'unequals' ? 'selected' : ''}>unequals</option>--%>
            <option value="like" ${param.property_operation == 'like' ? 'selected' : ''}>like</option>
            <%--<option value="exists" ${param.property_operation == 'exists' ? 'selected' : ''}>exists</option>--%>
        </select>
        <input name="hits_per_page" type="number" placeholder="Hits per page" />
    </fieldset>
    <input type="submit" />
</form>