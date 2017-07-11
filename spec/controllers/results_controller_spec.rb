require "rails_helper"

describe ResultsController do
  context "index" do
    context "with correct company id" do
      context "alpha" do
        it "returns a 200 with results" do
          get :index, :type => "alpha", :company_id => "124423"

          json = JSON.parse(response.body)

          expect(response.status).to eq(200)
          expect(json.count).to eq(25)
          expect(json[0]).to eq({ "period" => 1989, "value" => 767.28 })
        end
      end

      context "beta" do
        it "returns a 200 with results" do
          get :index, :type => "beta", :company_id => "124423"

          json = JSON.parse(response.body)

          expect(response.status).to eq(200)
          expect(json.count).to eq(25)
          expect(json[0]).to eq({ "period" => 1989, "value" => 157.31 })
        end
      end

      context "gama" do
        it "returns a 200 with results" do
          get :index, :type => "gama", :company_id => "124423"

          json = JSON.parse(response.body)

          expect(response.status).to eq(200)
          expect(json.count).to eq(25)
          expect(json[0]).to eq({ "period" => 1989, "value" => 294359.2992 })
        end
      end

      context "omega" do
        it "returns a 200 with results" do
          get :index, :type => "omega", :company_id => "124423"

          json = JSON.parse(response.body)

          expect(response.status).to eq(200)
          expect(json.count).to eq(25)
          expect(json[0]).to eq({ "period" => 1989, "value" => 60350.4084 })
        end
      end

      context "other data type" do
        it "returns a 400" do
          get :index, :type => "random", :company_id => "124423"

          json = JSON.parse(response.body)

          expect(response.status).to eq(400)
          expect(json["errors"]).to eq("No data found! Please specify correct data type!")
        end
      end
    end

    context "with wrong company id" do
      it "returns a 400" do
        get :index, :type => "alpha", :company_id => "123"

        json = JSON.parse(response.body)

        expect(response.status).to eq(400)
        expect(json["errors"]).to eq("No data found! Please specify correct company ID!")
      end
    end

    context "with no company id" do
      it "returns a 400" do
        get :index, :type => "alpha", :company_id => "123"

        json = JSON.parse(response.body)

        expect(response.status).to eq(400)
        expect(json["errors"]).to eq("No data found! Please specify correct company ID!")
      end
    end
  end
end