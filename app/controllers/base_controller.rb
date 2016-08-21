class BaseController < ApplicationController
  # # Prevent CSRF attacks by raising an exception.
  # # For APIs, you may want to use :null_session instead.
  # protect_from_forgery with: :null_session

  # # All authorization has to happen against a real object
  # # @resource must be present before any authorization.
  # before_action :find_resource, only: [:show, :update, :destroy]
  # before_action :find_resources, only: [:index]
  # before_action :reject_blank_post, only: [:create]
  # before_action :new_resource, only: [:create]

  # # authorize_resource_action is not on :create since :create often
  # # has to make a new well-formed resource to pass to authorize_resource_action
  # # therefore, the API controller implementer should call this directly.
  # before_action :authorize_resource_action, only: [:show, :update, :destroy, :create]
  # rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  def index
    @clubs = Club.all
    # render json: Club.all
    # if params[:limit]
    #   render_success @resources, true, total: @total_resources_count, offset: @offset
    # else
    #   render_success @resources, true
    # end
  end

  # def create
  #   # Requires existence of @resource via new_resource in order
  #   # to properly authorize and filter appropriately permitted_params
  #   # tailored to the user.
  #   @resource.update(permitted_params) ? render_success(@resource, true) : render_error(@resource)
  # end

  # def show
  #   render_success @resource, true
  # end

  # def update
  #   @resource.update(update_resource_params.merge(permitted_params)) ? render_success(@resource) : render_error(@resource)
  # end

  # def destroy
  #   @resource.destroy ? render_success(@resource) : render_error(@resource)
  # end

  # protected

  # def authenticate_user!
  #   catch(:warden) do
  #     super
  #   end
  #   # API endpoints should not result in redirect, but an unauthorized
  #   # status code response
  #   unauthorized unless current_user.present?
  # end

  # rescue_from ActiveRecord::RecordNotFound do
  #   render_error(nil, :not_found)
  # end

  # def permitted_params
  #   params.require(resource_name).permit(policy(@resource).permitted_attributes(action_name))
  # end

  # def resource_name
  #   controller_name.singularize
  # end

  # def render_success(resource, with_authorizers = false, meta_data = {})
  #   json_response = {
  #     resource_name => serialize(resource),
  #     meta: meta_data
  #   }
  #   if with_authorizers
  #     json_response[:meta].merge!(authorizers: AuthorizersService.fetch!(current_user, resource))
  #   end
  #   render json: json_response
  # end

  # def render_error(resource = nil, status = :bad_request)
  #   if resource
  #     render json: {
  #       status: status, errors: resource.errors
  #     },
  #            status: status
  #   else
  #     head status
  #   end
  # end

  # def unauthorized
  #   head :unauthorized
  #   false
  # end

  # def embeds
  #   params[:embed] && params[:embed].split(',') || []
  # end

  # def resource_class
  #   resource_name.classify.constantize
  # end

  # def serialize(resource)
  #   options = {
  #     root: false,
  #     embed: embeds.dup
  #   }
  #   serializer_for(resource).new(resource, options)
  # end

  # def serializer_for(resource)
  #   if resource.is_a?(Array) || resource.is_a?(ActiveRecord::Relation)
  #     ActiveModel::ArraySerializer
  #   else
  #     "#{resource_name}_serializer".classify.constantize
  #   end
  # end

  # # Supplies any parameters used to "seed" a new resource.
  # # Those parameters are ususually ones that are used by Policies
  # # and/or to set defaults not passed in.  This is expected to be
  # # overriden in each API controller.
  # def new_resource_params
  #   {}
  # end

  # def update_resource_params
  #   {}
  # end

  # def new_resource
  #   @resource = resource_class.new(new_resource_params)
  # end

  # def find_resource
  #   @resource = infer_eager_loads(resource_class).find(params[:id]) if params[:id]
  # end

  # def find_resources
  #   if params[:limit]
  #     @resources, @offset, @total_resources_count = limit_resources
  #   else
  #     @resources = filter_resources find_resources_query.all
  #   end
  # end

  # def find_resources_query
  #   infer_eager_loads(apply_scopes(resource_class))
  # end

  # def limit_resources
  #   total_resources_count = find_resources_query.count
  #   limit = params[:limit].to_i
  #   offset = params[:offset].to_i
  #   resources = resource_class.none
  #   while resources.count < limit && (offset < total_resources_count)
  #     resources += find_resources_query.limit(limit).offset(offset).order(params[:order])
  #     resources = filter_resources resources
  #     offset += limit
  #   end
  #   [resources, offset, total_resources_count]
  # end

  # def filter_resources(resources)
  #   PermissionFilter.filter_collection!(resources, "show", current_user, embeds)
  # end

  # # returns true/false plus modifies resource
  # # to decorate it with permitted attributes policy
  # def authorize_resource_action
  #   @resource = PermissionFilter.filter_record!(@resource, action_name, current_user, embeds)
  #   @resource.nil? ? unauthorized : true
  # end

  # def reject_blank_post
  #   render_error if params[resource_name].values.reject { |e| e.to_s.empty? }.empty?
  # end

  # def user_not_authorized
  #   if action_name == "index"
  #     render_success([])
  #   else
  #     render_error(nil, :unauthorized)
  #   end
  # end
end