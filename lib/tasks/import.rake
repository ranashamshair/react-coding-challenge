require 'json'

namespace :import do
  task :naics => :environment do 
    file = File.open(Rails.root.join("naics.json"), "r")
    imports = JSON.parse(file.read)

    imports.each do |import|
      code = import['Code'].to_s
      title = import['Title']
      description = import['Description']

      naisc_code = NaicsCode.new(code: code, title: title, description: description)

      if code.length == 2
      end
      case code.length
      when 2
      when 3
        naisc_code.sector_id = NaicsCode.where(code: code[0..1]).first.try(:id)
      when 4
        naisc_code.sector_id = NaicsCode.where(code: code[0..1]).first.try(:id)
        naisc_code.subsector_id = NaicsCode.where(code: code[0..2]).first.try(:id)
      when 5
        naisc_code.sector_id = NaicsCode.where(code: code[0..1]).first.try(:id)
        naisc_code.subsector_id = NaicsCode.where(code: code[0..2]).first.try(:id)
        naisc_code.industry_group_id = NaicsCode.where(code: code[0..3]).first.try(:id)
      when 6
        naisc_code.sector_id = NaicsCode.where(code: code[0..1]).first.try(:id)
        naisc_code.subsector_id = NaicsCode.where(code: code[0..2]).first.try(:id)
        naisc_code.industry_group_id = NaicsCode.where(code: code[0..3]).first.try(:id)
        naisc_code.naics_industry_id = NaicsCode.where(code: code[0..4]).first.try(:id)
      end

      naisc_code.save
    end
  end

  task :companies => :environment do
    file = File.open(Rails.root.join("companies.json"), "r")
    imports = JSON.parse(file.read)

    imports.each do |import|
      company = Company.new(
        name: import['name'], 
        avatar_url: import['avatar_url'],
        duns_number: import['duns_number'],
        created_at: import['created_at'],
        updated_at: import['updated_at']
      )

      next unless company.save

      ## Setup business structure. Create a new type if one doesn't exist
      business_structure = BusinessStructure.find_or_create_by(name: import['business_structure'])
      company.business_structure_id = business_structure.id

      ## Save NAICS code
      company.naics_code = NaicsCode.where(code: import['naics_code']).first

      ## Import all company addresses into address table
      import['addresses'].each do |address_import|
        address = Address.create(
          address_type: address_import['type'],
          address_line_1: address_import['street_address'],
          city: address_import['city'],
          state: address_import['state'],
          postal_code: address_import['postal_code'].to_i
        )

        company.addresses << address
      end
      company.save
    end
  end
end
