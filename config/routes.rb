Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :user_competences,        except: [:edit, :new, :delete]
      resources :person_questions,        except: [:edit, :new, :delete]
      resources :person_schedules,        except: [:edit, :new, :delete]
      resources :questions,               except: [:edit, :new, :delete]
      resources :authorized_vehicles,     except: [:edit, :new, :delete]
      resources :people,                  except: [:edit, :new, :delete]
      resources :person_types,            except: [:edit, :new, :delete]
      resources :condominium_children,    except: [:edit, :new, :delete]
      resources :condominia,              except: [:edit, :new, :delete]
      resources :competence_types,        except: [:edit, :new, :delete]
      resources :competences,             except: [:edit, :new, :delete]
      resources :filials,                 except: [:edit, :new, :delete]
      post 'login' => 'users#login'
    end
  end
  root to: 'home#index'
end
