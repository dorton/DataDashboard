# RailsAdmin config file. Generated on February 08, 2013 20:00
# See github.com/sferik/rails_admin for more informations

RailsAdmin.config do |config|

  # If your default_local is different from :en, uncomment the following 2 lines and set your default locale here:
  # require 'i18n'
  # I18n.default_locale = :de

  config.authorize_with :cancan
  config.current_user_method { current_teacher } # auto-generated



  # If you want to track changes on your models:
  # config.audit_with :history, Teacher

  # Or with a PaperTrail: (you need to install it first)
  # config.audit_with :paper_trail, Teacher

  # Set the admin name here (optional second array element will appear in a beautiful RailsAdmin red ©)
  config.main_app_name = ['Data Tracker', 'Admin']
  # or for a dynamic name:
  # config.main_app_name = Proc.new { |controller| [Rails.application.engine_name.titleize, controller.params['action'].titleize] }


  #  ==> Global show view settings
  # Display empty fields in show views
  # config.compact_show_view = false

  #  ==> Global list view settings
  # Number of default rows per-page:
  # config.default_items_per_page = 20

  #  ==> Included models
  # Add all excluded models here:
  # config.excluded_models = [Admin, Appraiser, Learningwalk, Observation, Search, Student, Teacher]

  # Add models here if you want to go 'whitelist mode':
  # config.included_models = [Admin, Appraiser, Learningwalk, Observation, Search, Student, Teacher]

  # Application wide tried label methods for models' instances
  # config.label_methods << :description # Default is [:name, :title]

  #  ==> Global models configuration
  # config.models do
  #   # Configuration here will affect all included models in all scopes, handle with care!
  #
  #   list do
  #     # Configuration here will affect all included models in list sections (same for show, export, edit, update, create)
  #
  #     fields_of_type :date do
  #       # Configuration here will affect all date fields, in the list section, for all included models. See README for a comprehensive type list.
  #     end
  #   end
  # end
  #
  #  ==> Model specific configuration
  # Keep in mind that *all* configuration blocks are optional.
  # RailsAdmin will try his best to provide the best defaults for each section, for each field.
  # Try to override as few things as possible, in the most generic way. Try to avoid setting labels for models and attributes, use ActiveRecord I18n API instead.
  # Less code is better code!
  # config.model MyModel do
  #   # Cross-section field configuration
  #   object_label_method :name     # Name of the method called for pretty printing an *instance* of ModelName
  #   label 'My model'              # Name of ModelName (smartly defaults to ActiveRecord's I18n API)
  #   label_plural 'My models'      # Same, plural
  #   weight -1                     # Navigation priority. Bigger is higher.
  #   parent OtherModel             # Set parent model for navigation. MyModel will be nested below. OtherModel will be on first position of the dropdown
  #   navigation_label              # Sets dropdown entry's name in navigation. Only for parents!
  #   # Section specific configuration:
  #   list do
  #     filters [:id, :name]  # Array of field names which filters should be shown by default in the table header
  #     items_per_page 100    # Override default_items_per_page
  #     sort_by :id           # Sort column (default is primary key)
  #     sort_reverse true     # Sort direction (default is true for primary key, last created first)
  #     # Here goes the fields configuration for the list view
  #   end
  # end

  # Your model's configuration, to help you get started:

  # All fields marked as 'hidden' won't be shown anywhere in the rails_admin unless you mark them as visible. (visible(true))

  # config.model Admin do
  #   # Found associations:
  #   # Found columns:
  #     configure :id, :integer 
  #     configure :first_name, :string 
  #     configure :last_name, :string 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime 
  #     configure :email, :string 
  #     configure :password, :password         # Hidden 
  #     configure :password_confirmation, :password         # Hidden 
  #     configure :reset_password_token, :string         # Hidden 
  #     configure :reset_password_sent_at, :datetime 
  #     configure :remember_created_at, :datetime 
  #     configure :sign_in_count, :integer 
  #     configure :current_sign_in_at, :datetime 
  #     configure :last_sign_in_at, :datetime 
  #     configure :current_sign_in_ip, :string 
  #     configure :last_sign_in_ip, :string   #   # Sections:
  #   list do; end
  #   export do; end
  #   show do; end
  #   edit do; end
  #   create do; end
  #   update do; end
  # end
  # config.model Appraiser do
  #   # Found associations:
  #     configure :teachers, :has_many_association   #   # Found columns:
  #     configure :id, :integer 
  #     configure :last_name, :string 
  #     configure :first_name, :string 
  #     configure :email, :string 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime   #   # Sections:
  #   list do; end
  #   export do; end
  #   show do; end
  #   edit do; end
  #   create do; end
  #   update do; end
  # end
  # config.model Learningwalk do
  #   # Found associations:
  #     configure :teacher, :belongs_to_association   #   # Found columns:
  #     configure :id, :integer 
  #     configure :observer, :string 
  #     configure :subject, :string 
  #     configure :highlights, :string 
  #     configure :growths, :string 
  #     configure :teacher_id, :integer         # Hidden 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime 
  #     configure :start_time, :datetime   #   # Sections:
  #   list do; end
  #   export do; end
  #   show do; end
  #   edit do; end
  #   create do; end
  #   update do; end
  # end
  # config.model Observation do
  #   # Found associations:
  #     configure :student, :belongs_to_association   #   # Found columns:
  #     configure :id, :integer 
  #     configure :on_task, :string 
  #     configure :observer, :string 
  #     configure :student_id, :integer         # Hidden 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime 
  #     configure :notes, :string 
  #     configure :off_task, :boolean   #   # Sections:
  #   list do; end
  #   export do; end
  #   show do; end
  #   edit do; end
  #   create do; end
  #   update do; end
  # end
  # config.model Search do
  #   # Found associations:
  #   # Found columns:
  #     configure :id, :integer 
  #     configure :keywords, :string 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime   #   # Sections:
  #   list do; end
  #   export do; end
  #   show do; end
  #   edit do; end
  #   create do; end
  #   update do; end
  # end
  # config.model Student do
  #   # Found associations:
  #     configure :teacher, :belongs_to_association 
  #     configure :observations, :has_many_association   #   # Found columns:
  #     configure :id, :integer 
  #     configure :last_name, :string 
  #     configure :first_name, :string 
  #     configure :stu_id, :string 
  #     configure :met_math_ayp, :boolean 
  #     configure :met_reading_ayp, :boolean 
  #     configure :bubble_math, :boolean 
  #     configure :bubble_reading, :boolean 
  #     configure :teacher_id, :integer         # Hidden 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime 
  #     configure :avatar, :string 
  #     configure :math_nce, :string 
  #     configure :reading_nce, :string 
  #     configure :reading_staar_scale, :string 
  #     configure :math_staar_scale, :string 
  #     configure :sped, :boolean 
  #     configure :elar_cat_1, :string 
  #     configure :elar_cat_2, :string 
  #     configure :elar_cat_3, :string 
  #     configure :math_cat_1, :string 
  #     configure :math_cat_2, :string 
  #     configure :math_cat_3, :string 
  #     configure :math_cat_4, :string 
  #     configure :math_cat_5, :string 
  #     configure :science_cat_1, :string 
  #     configure :science_cat_2, :string 
  #     configure :science_cat_3, :string 
  #     configure :science_cat_4, :string 
  #     configure :writing_cat_1, :string 
  #     configure :writing_cat_2, :string 
  #     configure :writing_cat_3, :string 
  #     configure :science_staar_scale, :string 
  #     configure :writing_staar_scale, :string 
  #     configure :met_reading_standard, :boolean 
  #     configure :reading_test_version, :string 
  #     configure :met_math_standard, :boolean 
  #     configure :math_test_version, :string 
  #     configure :depart_class, :string 
  #     configure :campus, :string   #   # Sections:
  #   list do; end
  #   export do; end
  #   show do; end
  #   edit do; end
  #   create do; end
  #   update do; end
  # end
  # config.model Teacher do
  #   # Found associations:
  #     configure :appraiser, :belongs_to_association 
  #     configure :students, :has_many_association 
  #     configure :learningwalks, :has_many_association   #   # Found columns:
  #     configure :id, :integer 
  #     configure :last_name, :string 
  #     configure :first_name, :string 
  #     configure :grade, :string 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime 
  #     configure :email_old, :string 
  #     configure :password, :password         # Hidden 
  #     configure :password_confirmation, :password         # Hidden 
  #     configure :reset_password_token, :string         # Hidden 
  #     configure :reset_password_sent_at, :datetime 
  #     configure :remember_created_at, :datetime 
  #     configure :sign_in_count, :integer 
  #     configure :current_sign_in_at, :datetime 
  #     configure :last_sign_in_at, :datetime 
  #     configure :current_sign_in_ip, :string 
  #     configure :last_sign_in_ip, :string 
  #     configure :email, :string 
  #     configure :appraiser_id, :integer         # Hidden 
  #     configure :apprai, :string 
  #     configure :apprai_email, :string 
  #     configure :role, :string 
  #     configure :departmental, :boolean 
  #     configure :depart_class, :string 
  #     configure :superuser, :boolean 
  #     configure :campus, :string   #   # Sections:
  #   list do; end
  #   export do; end
  #   show do; end
  #   edit do; end
  #   create do; end
  #   update do; end
  # end
end
