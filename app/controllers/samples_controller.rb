class SamplesController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def create
    data = params[:data]
    strings = data.split("\n")[2..-1]
    strings.each do |string|
      sample_type, held, maxheld, barrier, limit, failcnt = string.gsub(/^[^:]+:/, '').split(/\s+/)[1..-1]
      Sample.create!(
          sample_type: sample_type,
          held: held,
          maxheld: maxheld,
          barrier: barrier,
          limit: limit,
          failcnt: failcnt
        ) unless sample_type == 'dummy'
    end
    Rails.logger.info "strings = #{strings}"
    render text: 'OK'
  end

  def index
    @scope = Sample
    @scope = @scope.where(sample_type: params[:type]) if params[:type]
    @scope = @scope.where('created_at > ?', 1.day.ago)
  end
end