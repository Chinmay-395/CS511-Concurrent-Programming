% % this is a . hrl ( header ) file .
-record(included, {
    some_field,
    some_default = " yeah ! ",
    unimaginative_name
}).
#included{some_field = " Some value ", some_default = " yeah ! ", unimaginative_name = undefined}
