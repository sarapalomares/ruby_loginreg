class UsersController < ApplicationController
before_action :check_status, except: [:index, :create, :login, :logout]

  def index
  end

  def show
      @user = User.find(session[:user_id])
      @users_all = User.all.order(first_name: :asc)
  end

  def create
      user = User.create(first_name: params[:f_name], last_name: params[:l_name], email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation])
      if user.valid?
            session[:user_id] = user.id
            redirect_to '/show'
      else
            flash[:errors] = user.errors.full_messages.to_sentence
            redirect_to '/'
      end
  end

  def info
      @user = User.find(session[:user_id])
  end

  def edit
      @user = User.find(session[:user_id])
  end

  def login
        user = User.find_by_email(params[:email])
        if user && user.authenticate(params[:password])
            session[:user_id] = user.id
            redirect_to '/show'
        else
            flash[:message] = "Invalid login. Please try again."
            redirect_to '/show'
        end
    end

    def update
      User.find(session[:user_id]).update(first_name: params[:f_name], last_name: params[:l_name], email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation])

      redirect_to "/show"
    end

  def logout
        session[:user_id] = nil
        redirect_to '/'
    end

    private

    def check_status
        if !session[:user_id]
            redirect_to '/'
        end
    end
end
