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

	def bootstrap_class_for(flash_type)
		case flash_type.to_sym
			when :success
				"alert-success" # Green
			when :error
				"alert-danger" # Red
			when :alert
				"alert-warning" # Yellow
			when :notice
				"alert-info" # Blue
			else
				flash_type.to_s
		end
	end
end
