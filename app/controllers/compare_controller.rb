class CompareController < ApplicationController
    EVALUATIVE_CRITERIA = {
        same_number_keys: 0.2,
        same_name_keys: 0.3,
        similarity_values: 0.5
      }.freeze

    def execute
        first_json_file = params[:first_json]
        second_json_file = params[:second_json]
        @result = "Enter valid files" if first_json_file.nil? || second_json_file.nil?
        @result = SimilarityScorer.score(first_json_file.read, second_json_file.read)
        render :index
    end
    
end
