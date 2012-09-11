namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    require 'populator'
    require 'faker'

  

    PeriodRegistration.destroy_all
    ProductRequest.destroy_all
    CartRow.destroy_all
    Cart.destroy_all
    Event.destroy_all
    Inquery.destroy_all
    Product.destroy_all
    User.destroy_all
    Period.destroy_all

    admin = User.create!(email: "admin@example.com",
                 password: "password",
                 password_confirmation: "password",
                 first_name: 'Adam',
                 last_name: 'Smith',
                 specialty: 'Neurosurgery',
                 license_number: 23432442,
                 state: "Arizona")
    admin.toggle!(:admin)

    admin = User.create!(email: "sam.smith@example.com",
                 password: "password",
                 password_confirmation: "password",
                 first_name: 'Sam',
                 last_name: 'Smith',
                 specialty: 'Neurosurgery',
                 license_number: 23435432,
                 state: "Arizona")
      admin = User.create!(email: "sarah.jones@example.com",
                 password: "password",
                 password_confirmation: "password",
                 first_name: 'Sarah',
                 last_name: 'Jones',
                 specialty: 'Neurosurgery',
                 license_number: 23439432,
                 state: "Arizona")

    Cholecap10 = Product.create( name: "Cholecap - 10mg",
                                 description:
 "Cholecap &reg; (rosuvastatin calcium) is a prescription drug belonging to a group of medicines" +
 "&#821 called statins &#8212; that are used to treat high cholesterol. When diet and exercise alone" +
 " aren't enough, adding Cholecap can help. Cholecap, along with diet, helps lower LDL (bad) cholesterol" +
 " and raise HDL (good) cholesterol. It's also been proven to slow the progression  of atherosclerosis, " + 
 "the buildup of plaque in your arteries over time, as part of a treatment plan to lower cholesterol to goal.",
                                 stock: 10,
                                 limit: 10)
    Cholecap20 = Product.create( name: "Cholecap - 20mg",
                                 description:  "Cholecap &reg; (rosuvastatin calcium) is a prescription drug belonging to a group of medicines" +
 "&#821 called statins &#8212; that are used to treat high cholesterol. When diet and exercise alone" +
 " aren't enough, adding Cholecap can help. Cholecap, along with diet, helps lower LDL (bad) cholesterol" +
 " and raise HDL (good) cholesterol. It's also been proven to slow the progression  of atherosclerosis, " + 
 "the buildup of plaque in your arteries over time, as part of a treatment plan to lower cholesterol to goal.",
                                 stock: 10,
                                 limit: 10)

    Labrinone50 = Product.create( name: "Labrinone - 50mg",
                                 description: "Labrinone &reg; (ciclesonide) is a once-a-day medication" +
"indicated for the treatment of Parkinson's Disease. It's an effective medication for reducing symptoms of" + 
"Parkinson's including resting tremor, bradykinesia, rigidity and postural instability.",
                                 stock: 100,
                                 limit: 3)

    Labrinone100 = Product.create( name: "Labrinone - 100mg",
                                 description: "Labrinone &reg; (ciclesonide) is a once-a-day medication" +
"indicated for the treatment of Parkinson's Disease. It's an effective medication for reducing symptoms of" + 
"Parkinson's including resting tremor, bradykinesia, rigidity and postural instability.",
                                 stock: 100,
                                 limit: 3)

    Restolar25 = Product.create( name: "Restolar - 25mg",
                                 description: "Levodopa is a substance that is converted into " +
"dopamine by an enzyme in the brain. It is then released by brain cells and activates dopamine" + 
"receptors allowing for normal function of the movement control centers of the brain. " + 
"Forty years after its discovery, levodopa remains the most effective medication for Parkinson's disease. " +
"In fact, 70 to 80 percent of treated Parkinson's patients are on levodopa therapy. Levodopa is the \"gold standard\"" +
"by which all treatments for Parkinson's are measured.",
                                 stock: 3,
                                 limit: 15)

    Voderal200 = Product.create( name: "Voderal - 200mg",
                                 description: "VODERAL &reg; is indicated for the relief of moderate to" + 
"moderately severe pain. VODERAL combines the efficacy of hydrocodone with the lowest dose of acetaminophen" +
"available of the commonly prescribed  hydrocodone/acetaminophen combination products.",
                                 stock: 150,
                                 limit: 8)

    Voderal400 = Product.create( name: "Voderal - 400mg",
                                description: "VODERAL &reg; is indicated for the relief of moderate to" + 
"moderately severe pain. VODERAL combines the efficacy of hydrocodone with the lowest dose of acetaminophen" +
"available of the commonly prescribed  hydrocodone/acetaminophen combination products.",
                                 stock: 150,
                                 limit: 8)

   

    Event.populate 6 do |event|
      event.name = Populator.words(1).titleize + " Event"
      event.date = 10.days.from_now..15.days.from_now
      event.city = Faker::Address.city
      event.street = Faker::Address.street_address
      event.state = Faker::Address.us_state
      event.name = "Verteo: #{event.city}"


      time = ["4:00", "7:30", "8:40", "9:50"]
      count = 0
      Period.populate 4 do |period|
        r = Random.new
        product_value = r.rand(1..7)
        period.product_id = product_value
        starter = ["Intro To " , "Breakthroughs Using ", "New Research On ", "Increasing Effectness Off ", "New Ways To Use "].shuffle.first
        period.name = starter + Product.find(product_value).name.gsub(/\s-\s\w*/,"")
        period.event_id = event.id
        period.start_time = Time.parse(time[count])
        count += 1
        period.end_time = period.start_time + 1.hours
        period.product_id = [1..7].shuffle.first
        period.description = ["Learn about the new and improved,", "Introducing the best," "Learn how you can,"].shuffle.first + Faker::Lorem.paragraph(4)
      end
    end


    def populate_user(num_of_days)
      r = Random.new
      first_name = Faker::Name.first_name
      last_name = Faker::Name.last_name
      email_domain = ['columbia.edu', 'jhu.edu', 'mayoclinic.org', 'anokacounty.org', 'desmoines.ia.gov', 'rogersvalley.com'].shuffle.first
      email = "#{first_name}.#{last_name}@#{email_domain}"
      password  = "password"
      license_number = r.rand(102348920..999999999)
      state = Faker::Address.us_state
      specialty = ['Allergy and Immunology', 'Anaesthetics','Pathology','Cardiology',
        'Paediatric Cardiology','Cardiothoracic Surgery','Clinical Neurophysiology',
        'Dermato-Venereology','Endocrinology','Gastroenterology','Geriatrics','Gynaecology and Obstetrics',
        'Health Informatics','Infectious Diseases','Internal Medicine','Interventional Radiology',
        'Vascular','Microbiology','Nephrology','Neurology','Neurosurgery'].shuffle.first
      user = User.create!(first_name: first_name, last_name: last_name, email: email,
                         password: password, password_confirmation: password, 
                         state: state, license_number: license_number, specialty: specialty)
      user.created_at = user.created_at - (rand*num_of_days).days
      user.save

      if user.id % 2 == 0
        reg = PeriodRegistration.new
        reg.period_id = r.rand(1..24)
        reg.user_id = user.id
        reg.save
        reg.created_at = user.created_at + (rand*5).days
        reg.save
      end

      Inquery.populate 1 do |inquery|
        inquery.product_id = [1..7].shuffle.first
        inquery.message = Faker::Lorem.paragraphs(2)
        inquery.phone = Faker::PhoneNumber.phone_number
        inquery.street = Faker::Address.street_address
        inquery.state = Faker::Address.us_state
        inquery.city = Faker::Address.city
        inquery.zip = r.rand(10000..99999)
        inquery.user_id = user.id
        inquery.perfered_method = ['Phone', 'Postal Address', 'Email'].shuffle.first
      end



      ProductRequest.populate 1 do |request|
        request.product_id = [1..7].shuffle.first
        request.user_id = user.id
        request.quantity = [1..3].shuffle.first
        request.street = Faker::Address.street_address
        request.state = Faker::Address.us_state
        request.city = Faker::Address.city
        request.zip = r.rand(10000..99999)
        request.status = ['New', 'Processing', 'Shipped'].shuffle.first
      end
    end

    25.times do |n|
      populate_user(30)
    end

    75.times do |n|
      populate_user(10)
    end

    pr = ProductRequest.all
    pr.each do |pr|
      r = Random.new
      if pr.id % 5 == 0
        pr.created_at = pr.created_at - (r.rand*10).days
        if pr.created_at < Date.today - 3
          pr.status = 'Shipped'
        end
        pr.product_id = r.rand(1...3)
        pr.save
      else
         pr.created_at = pr.created_at - (r.rand*30).days
          if pr.created_at < Date.today - 3
          pr.status = 'Shipped'
        end
         
        pr.save
      end
    end

     inquery = Inquery.all
    inquery.each do |inquery|
      r = Random.new
      if inquery.id % 5 == 0
        inquery.created_at = inquery.created_at - (r.rand*10).days
        inquery.product_id = r.rand(1...3)
        inquery.save
      else
         inquery.created_at = inquery.created_at - (r.rand*30).days
        inquery.save
      end
    end

    

    
  end
end