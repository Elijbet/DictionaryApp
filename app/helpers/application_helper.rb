module ApplicationHelper

		def flash_class(level)
    case level.to_sym
        when :success then "alert alert-success"
        when :notice then "alert alert-info"
        when :alert then "alert alert-warning"
        when :error then "alert alert-danger"
    end
  end

  def alerts
  	alert = (flash[:alert] || flash[:error] || flash[:notice])

  	if alert 
  		alert_generator alert
  	end
  end

  	def alert_generator msg
  		js add_gritter(msg, title: "CodeUp Club Dictionary", sticky: false)
  	end
  
  
end
