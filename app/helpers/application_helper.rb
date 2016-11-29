module ApplicationHelper
	def active_menu_item(path, matching = :eq)
	    case matching.to_sym
	    when :eq
	      request.path == path ? 'active' : ''
	    when :starts_with
	      request.path.start_with?(path) ? 'active' : ''
	    else
	        ''
    	end
  	end
end
