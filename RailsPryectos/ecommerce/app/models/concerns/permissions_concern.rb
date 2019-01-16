module PermissionsConcern extend ActiveSupport::Concern
	def is_normal_user?
		self.permision_level == 0
	end
	def is_admin?
		self.permision_level >= 3
	end
end