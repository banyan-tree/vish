require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the Controller, controllers: true code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# Controller, controllers: true code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

#          excursions_last_slide          /excursions/last_slide(.:format)                                     excursions#last_slide
#             excursions_preview          /excursions/preview(.:format)                                        excursions#preview
#        excursions_interactions          /excursions/interactions(.:format)                                   excursions#interactions
#                                         /excursions/:id/metadata(.:format)                                   excursions#metadata
#                                         /excursions/:id/scormMetadata(.:format)                              excursions#scormMetadata
#                                         /excursions/:id/clone(.:format)                                      excursions#clone
#                                         /excursions/:id/evaluate(.:format)                                   excursions#evaluate
#                                         /excursions/:id.mashme(.:format)                                     excursions#show {:format=>"gateway", :gateway=>"mashme"}
#                                         /excursions/:id.embed(.:format)                                      excursions#show {:format=>"full"}
#             excursions_tmpJson POST     /excursions/tmpJson(.:format)                                        excursions#uploadTmpJSON
#                                GET      /excursions/tmpJson(.:format)                                        excursions#downloadTmpJSON
#                                GET      /excursions(.:format)                                                excursions#index
#                                POST     /excursions(.:format)                                                excursions#create
#                  new_excursion GET      /excursions/new(.:format)                                            excursions#new
#                 edit_excursion GET      /excursions/:id/edit(.:format)                                       excursions#edit
#                      excursion GET      /excursions/:id(.:format)                                            excursions#show
#                                PUT      /excursions/:id(.:format)                                            excursions#update
#                                DELETE   /excursions/:id(.:format)                                            excursions#destroy

describe ExcursionsController, controllers: true do


  # This should return the minimal set of attributes required to create a valid
  # Excursion. As you add validations to Excursion, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    {}
  end

	before do
		@user = Factory(:user_vish)
		@excursion = Factory(:excursion, author: @user.actor, owner: @user.actor )
	end

	it 'get excursion' do
		sign_in @user
		Excursion.where(id: @excursion.id).should exist
		get :show, id: @excursion.id
		assert_response :success
	end
	
	it 'create excursion' do
		sign_in @user
		get :new
		assert_response :success
	end
	
	it 'edit excursion' do
		sign_in @user
		get :edit, id: @excursion.id
		assert_response :success
	end
	
	it 'delete excursion' do
		sign_in @user
		Excursion.where(id: @excursion.id).should exist
		get :destroy, id: @excursion.id
		response.should redirect_to(@user)
		Excursion.where(id: @excursion.id).should_not exist
	end
	
	it 'index excursion' do
		sign_in @user
		get :index
		assert_response :success
	end


end
