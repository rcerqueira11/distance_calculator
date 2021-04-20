module ApplicationHelper
	def automated_paginater(collection, param_name = 'page', number_of_links = 1, params: {})
			will_paginate collection, previous_label: 'Anterior', param_name: param_name, next_label: 'Siguiente', inner_window:number_of_links, renderer: RemoteLinkPagination::LinkRenderer, params: params
	end
end
