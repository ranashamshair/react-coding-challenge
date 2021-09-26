class CompaniesController < ApplicationController

  def index
    respond_to do |format|
      format.html
      format.json  {
        @companies = Company.includes(:business_structure, :naics_code, :primary_address)

        if params[:name].present?
          @companies = @companies.where("companies.name ILIKE ?", "#{params[:name]}%")
        end

        if params[:naics_code].present? && params[:naics_code] != 'all'
          @companies = @companies.joins("
            INNER JOIN naics_codes ON companies.naics_code_id = naics_codes.id AND
            naics_codes.code LIKE '#{params[:naics_code]}%'
          ")
        end

        if params[:business_structure].present? && params[:business_structure] != 'all'
          @companies = @companies.joins("
            INNER JOIN business_structures ON companies.business_structure_id = business_structures.id AND
            business_structures.id = #{params[:business_structure]}
          ")
        end

        if params[:sort].present?
          @companies = @companies.order(name: params[:sort])
        end

        total = @companies.count

        per_page = [[params[:per_page].to_i || 5, 1000].min, 5].max
        page = params[:page].to_i || 1
        offset = [per_page * (page - 1), 0].max

        @companies = @companies.limit(per_page)
        @companies = @companies.offset(offset)

        render json: {
          companies: @companies.as_json(
            include: {
              primary_address: {},
              business_structure: {},
              naics_code: {}
            }
          ),
          pagination: {
            total: total
          }
        }, status: :ok 
      }
    end

  end
end
