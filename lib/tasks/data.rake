namespace :data do
  desc "Create an initial dataset"
  task dataset: :environment do
    Squad.delete_all
    User.delete_all

    puts 'Creating core data'
    puts Rails.root
    core = Squad.create!(name: 'CORE', product_owner_id: nil, scrum_master_id: nil)
    reed = User.create!(first_name: 'Reed', last_name: 'Wilson', email: 'rwilson@test.com', position: 5, picture: File.open("/images/missing_photo"))
    javi = User.create!(first_name: 'Javier', last_name: 'Gonzalez', email: 'jgonzalezn@theappraisallane.com',
                        position: 1, picture: File.open("/images/#{first_name}#{last_name}"))
    core.update!(product_owner: reed, scrum_master: javi)
    puts 'Finished creating core data'
  end

end
