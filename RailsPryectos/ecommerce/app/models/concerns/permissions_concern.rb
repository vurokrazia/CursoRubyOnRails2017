module PermissionsConcern extend ActiveSupport::Concern
	def is_normal_user?
		self.permission_level == 0
	end
	def is_admin?
		self.permission_level >= 9
	end
end