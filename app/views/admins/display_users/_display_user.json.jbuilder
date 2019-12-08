json.extract! display_user, :id, :name, :kana, :description, :email, :sex, :age, :sort_num, :show_at_top_flag, :created_at, :updated_at
json.url display_user_url(display_user, format: :json)