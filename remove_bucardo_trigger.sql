do
$$
declare
    _row record;
    _query text;
begin
    for _row in SELECT tgname, tgrelid::regclass as table_name FROM pg_trigger where tgname ~ 'bucardo'  loop
        _query := format('drop trigger %s on %s', _row.tgname, _row.table_name);
        raise notice '%', _query;
        -- execute _query;
    end loop;
end
$$;