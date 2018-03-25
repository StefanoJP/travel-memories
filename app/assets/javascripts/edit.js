$("#log-modal").html("<%= escape_javascript(render 'show') %>")
$("#log-modal").modal("show")
