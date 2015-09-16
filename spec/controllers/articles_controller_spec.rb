require 'spec_helper'

describe ArticlesController do
  shared_examples "public access to articles" do
    describe 'GET #show' do
      before :each do
        @article = create(:article)
        get :show, id: @article
      end

      it "assigns the requested article to @article" do
        expect(assigns(:article)).to eq @article
      end

      it "render the :show template" do
        expect(response).to render_template :show
      end
    end

    describe 'GET #index' do
      before :each do
        @articles = []
        category = create(:category)
        2.times { |index| @articles << create(:article, { title: "test#{index}", category: category }) }
        get :index
      end

      it "populates an array of articles" do
        expect(assigns(:articles)).to match_array(@articles)
      end

      it "render the :index tmplate" do
        expect(response).to render_template :index
      end
    end
  end

  shared_examples "full access to articles" do
    describe 'GET #edit' do
      before :each do
        @article = create(:article)
        get :edit, id: @article
      end

      it "assigns the requested article to @article" do
        expect(assigns(:article)).to eq @article
      end

      it "render the :edit template" do
        expect(response).to render_template :edit
      end
    end

    describe 'GET #new' do
      before :each do
        get :new
      end

      it "assigns a new aticle to @article" do
        expect(assigns(:article)).to be_a_new(Article)
      end

      it "render the :new tmplate" do
        expect(response).to render_template :new
      end
    end

    describe 'POST #create' do
      context 'with valid attributes' do
        before :each do
          @category = create(:category)
        end
        it "saves the new aticle in the database" do
          expect do
            post :create, article: attributes_for(:article, category_id: @category.id)
          end.to change(Article, :count).by(1)
        end

        it "redirects to aticles#show" do
          post :create, article: attributes_for(:article, category_id: @category.id)
          expect(response).to redirect_to article_path(assigns(:article))
        end
      end

      context 'without valid attributes' do
        it "does not save the new article in the database" do
          expect do
            post :create, article: attributes_for(:invalid)
          end.to_not change(Article, :count).by(1)
        end

        it "re-renders the :new tmplate" do
          post :create, article: attributes_for(:invalid)
          expect(response).to render_template :new
        end
      end
    end

    describe 'PATCH #update' do
      context 'with valid attributes' do
        before :each do
          @article = create(:article)
          patch :update, id: @article, article: attributes_for(:article, title: 'another title')
        end

        it "located the requested @article" do
          expect(assigns(:article)).to eq @article
        end

        it "updates the article in the database" do
          @article.reload
          expect(@article.title).to eq 'another title'
        end

        it "redirects to the article" do
          expect(response).to redirect_to article_path(@article)
        end
      end

      context 'without valid attributes' do
        before :each do
          @article = create(:article, title: 'first_title')
          patch :update, id: @article, article: attributes_for(:article, title: nil)
        end

        it "does not update the article" do
          @article.reload
          expect(@article.title).to eq 'first_title'
        end

        it "re-renders the #edit template" do
          expect(response).to render_template :edit
        end
      end
    end

    describe 'DELETE #destroy' do
      before :each do
        @article = create(:article)
      end

      it "deletes the article from the database" do
        expect do
          delete :destroy, id: @article
        end.to change(Article, :count).by(-1)
      end

      it "redirects to articles#index" do
        delete :destroy, id: @article
        expect(response).to redirect_to articles_url
      end
    end
  end

  describe "guest access" do
    it_behaves_like "public access to articles"

    describe 'GET #new' do
      it 'requires login' do
        get :new
        expect(response).to require_login
      end
    end

    describe 'GET #edit' do
      it 'requires login' do
        get :edit, id: create(:article)
        expect(response).to require_login
      end
    end

    describe 'POST #create' do
      it 'requires login' do
        post :create, article: build(:article)
        expect(response).to require_login
      end
    end

    describe 'PATCH #update' do
      it 'requires login' do
        article = create(:article)
        patch :update, id: article, article: article
        expect(response).to require_login
      end
    end

    describe 'DELETE #destroy' do
      it 'requires login' do
        delete :destroy, id: create(:article)
        expect(response).to require_login
      end
    end
  end

  describe "user access to articles" do
    before :each do
      user_login(create(:user))
    end

    it_behaves_like "public access to articles"
    it_behaves_like "full access to articles"
  end
end
