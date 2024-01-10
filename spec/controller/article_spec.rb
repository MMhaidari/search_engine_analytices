require 'rails_helper'

RSpec.describe ArticlesController, type: :controller do
  describe 'GET #index' do
    context 'when query param is present' do
      let(:query) { 'Future world' }

      before do
        allow(controller).to receive(:query_param).and_return(query)
      end

      it 'calls search_create method if query length is greater than or equal to 2' do
        expect(controller).to receive(:search_create)
        get :index
      end
    end
    
    context 'when valid_search_request? is false' do
        before do
          allow(controller).to receive(:query_param).and_return('h')
        end
  
        it 'does not call save_search method' do
          expect(controller).not_to receive(:search_create)
          get :index
        end
      end

      context 'when query param is present and valid search request' do
        let(:query) { 'Future world' }
  
        before do
          allow(controller).to receive(:query_param).and_return(query)
        end
  
        it 'calls save_search method' do
          expect(controller).to receive(:search_create)
          get :index
        end
      end
  end
end
