module HasOffers

  class DummyResponse

    class << self
    
      def response_for(target, method, params)
        body = self.send("response_for_#{target.downcase}_#{method.downcase}", params)
        DummyResponse.new(200, 'Ok', body, {})
      end

      # Assume return_object is set for simplicity which means just the id of offer is returned
      def response_for_offer_create(params)
        {"response" => { "status" => 1, "data" => rand(1_000_000).to_s, "errors" => [] } }
      end

      def response_for_offer_update(params)
        {"response" => { "status" => 1, "data" => true, "errors" => [] } }
      end

      def response_for_offer_generatetrackinglink(params)
        {"response" => { "status" => 1, "data" => { "affiliate_id" => params["affiliate_id"], "offer_id" => params["offer_id"], "click_url" => "http://my-example-pixel.com/aff_c?offer_id=#{params["offer_id"]}&aff_id=#{params["affiliate_id"]}&#{params["params"].to_query}", "impression_pixel" => "<img src=\"http://my-example-pixel.com/aff_c?offer_id=#{params["offer_id"]}&aff_id=#{params["affiliate_id"]}&#{params["params"].to_query}\" width=\"1\" height=\"1\" />" }, "errors" => [] } }
      end

      def response_for_offer_generatetrackingpixel(params)
        {"response" => { "status" => 1, "data" => { "test_click_url" => "http://my-example-pixel.com/aff_c?offer_id=#{params["offer_id"]}&source=testoffer&aff_sub=testoffer", "code" => "<!-- Offer Conversion: --> <iframe src=\"https://my-example-pixel.com/XXXX\" scrolling=\"no\" frameborder=\"0\" width=\"1\" height=\"1\"></iframe> <!-- // End Offer Conversion -->", "url" => "https://my-example-pixel.com/XXXX", "domain" => "https://my-example-pixel.com" }, "errors" => [] } }
      end

      def response_for_goal_create(params)
        {"response" => { "status" => 1, "data" => rand(1_000_000).to_s, "errors" => [] } }
      end

      def response_for_goal_update(params)
        {"response" => { "status" => 1, "data" => true, "errors" => [] } }
      end

      def response_for_goal_generatetracking(params)
        {"response" => { "status" => 1, "data" => { "impression_code" => "<!-- Offer Goal Impression: --> <img src=\"http://my-example-pixel.com/XXXX\" width=\"1\" height=\"1\" /> <!-- // End Offer Goal Impression -->", "click_code" => "<!-- Offer Goal Click: --> <img src=\"http://my-example-pixel.com/XXXX\" width=\"1\" height=\"1\" /> <!-- // End Offer Goal Click -->", "conversion_code" => "<!-- Offer Goal Conversion: --> <iframe src=\"https://my-example-pixel.com/XXXX\" scrolling=\"no\" frameborder=\"0\" width=\"1\" height=\"1\"></iframe> <!-- // End Offer Goal Conversion -->", "conversion_url" => "https://my-example-pixel.com/XXXX" }, "errors" => [] } }
      end

      def response_for_offerpixel_create(params)
        if params["return_object"]
          {
            "response" => {
              "status" => 1,
              "errors" => [],
              "data" => {
                "OfferPixel" => {
                  "id" => rand(1_000_000).to_s
                }
              }
            }
          }
        else
          {"response" => { "status" => 1, "data" => rand(1_000_000).to_s, "errors" => [] } }
        end
      end

      def response_for_offerpixel_update(params)
        {"response" => { "status" => 1, "data" => true, "errors" => [] } }
      end

      def response_for_offerpixel_findall(params)
        {"response" => { "status" => 1, "data" => {"1" => {"OfferPixel" => {"id" => "1", "affiliate_id" => 2, "offer_id" => 1, "code" => "<div id=\"pixel_code_1\" style=\"white-space:pre;><p><img src=\"http://my-example-pixel.com\" /></p></div>", "status" => "active", "type" => "image"}}}, "errors" => {} } }
      end

      def response_for_offerurl_create(params)
        {"response" => { "status" => 1, "data" => rand(1_000_000).to_s, "errors" => [] } }
      end

      def response_for_offerurl_update(params)
        {"response" => { "status" => 1, "data" => true, "errors" => [] } }
      end

      def response_for_affiliate_findall(params)
        {
          "response"=>{"status"=>1, "data"=> {
            "6"=>{"Affiliate"=>{"id"=>"6", "source_brand_id"=>"10", "company"=>"AdappSolutions", "address1"=>"2200 Western Ave", "address2"=>"", "city"=>"Seattle", "region"=>"WA", "country"=>"US", "other"=>nil, "zipcode"=>"98121", "phone"=>"2065081318", "fax"=>"", "website"=>nil, "date_added"=>"2009-11-18 16:17:18", "modified"=>1271216343, "signup_ip"=>"173.10.106.174", "status"=>"pending", "wants_alerts"=>"1", "account_manager_id"=>nil, "network_map_id"=>nil, "payment_method"=>"check", "payment_terms"=>"net 30", "w9_filed"=>"0", "referral_id"=>nil, "affiliate_tier_id"=>nil, "fraud_activity_score"=>nil, "fraud_profile_score"=>"20", "fraud_activity_alert_threshold"=>nil, "fraud_activity_block_threshold"=>nil, "fraud_profile_alert_threshold"=>nil, "fraud_profile_block_threshold"=>nil, "account_id"=>"75809"}},
            "16"=>{"Affiliate"=>{"id"=>"16", "source_brand_id"=>"10", "company"=>"X", "address1"=>"Xavier Institute", "address2"=>"", "city"=>"Westchester County", "region"=>"NY", "country"=>"US", "other"=>nil, "zipcode"=>"10550", "phone"=>"9145551212", "fax"=>nil, "website"=>nil, "date_added"=>"2010-05-20 19:18:42", "modified"=>1274397810, "signup_ip"=>"10.1.1.74", "status"=>"active", "wants_alerts"=>"1", "account_manager_id"=>"3", "network_map_id"=>nil, "payment_method"=>"check", "payment_terms"=>"net 30", "w9_filed"=>"0", "referral_id"=>nil, "affiliate_tier_id"=>nil, "fraud_activity_score"=>nil, "fraud_profile_score"=>"27", "fraud_activity_alert_threshold"=>nil, "fraud_activity_block_threshold"=>nil, "fraud_profile_alert_threshold"=>nil, "fraud_profile_block_threshold"=>nil, "account_id"=>"79876"}}
          },
          "errors"=>[]}
        }
      end

      def response_for_affiliate_create(params)
        {"response" => { "status" => 1, "data" => rand(1_000_000).to_s } }
      end

      def response_for_affiliate_update(params)
        {"response" => { "status" => 1, "data" => true, "errors" => [] } }
      end

      def response_for_affiliatebilling_createinvoice(params)
        {"response" => { "status" => 1, "data" => rand(1_000_000).to_s } }
      end

      def response_for_affiliatebilling_updateinvoice(params)
        {"response" => { "status" => 1, "data" => true, "errors" => [] } }
      end

      def response_for_advertiser_findall(params)
        {"response" => { "status" => 1, "data" => {"1" => {"Advertiser" => {"id" => "1", "company" => "Dominoes"}}}, "errors" => {} } }
      end

      def response_for_advertiser_create(params)
        {"response" => { "status" => 1, "data" => rand(1_000_000).to_s } }
      end

      def response_for_advertiser_update(params)
        {"response" => { "status" => 1, "data" => true, "errors" => [] } }
      end

      def response_for_conversion_create(params)
        {"response" => { "status" => 1, "data" => rand(1_000_000).to_s } }
      end

      def response_for_conversion_update(params)
        {"response" => { "status" => 1, "data" => true, "errors" => [] } }
      end

      def response_for_affiliatebilling_findinvoicestats(params)
        {"response" => { "status" => 1, "data" => {"start_date" => params["start_date"], "end_date" => params["end_date"], "data" => [{"Stat" => {"type" => "stats", "offer_id" => "1", "payout_type" => "cpa_flat", "currency" => "USD", "amount" => "26.00000", "impressions" => "0", "clicks" => "0", "conversions" => "5", "revenue" => "2.50", "sale_amount" => "50.00"}}] }}}
      end

      def response_for_affiliatebilling_findallinvoices(params)
        {"response" => { "status" => 1, "data" => {"1" => {"AffiliateInvoice" => {"id" => "1", "affiliate_id" => "2", "datetime" => "2009-06-02 20:14:05", "start_date" => "2009-06-01", "end_date" => "2009-06-02", "is_paid" => "1", "memo" => "asdf", "status" => "active", "notes" => "", "receipt_id" => nil, "currency" => "USD", "amount" => "12.00", "conversions" => "12" }}}, "errors" => []}}
      end

      def response_for_affiliatebilling_findallinvoicesbyids(params)
        {"response" => { "status" => 1, "data" => {"1" => {"AffiliateInvoice" => {"id" => "1", "affiliate_id" => "2", "datetime" => "2009-06-02 20:14:05", "start_date" => "2009-06-01", "end_date" => "2009-06-02", "is_paid" => "1", "memo" => "asdf", "status" => "active", "notes" => "", "receipt_id" => nil, "currency" => "USD", "amount" => "12.00", "conversions" => "12" }}}, "errors" => []}}
      end

      def response_for_report_getstats(params)
        {"response"=>{"data"=>{"pageCount"=>1, "data"=>[{"Stat"=>{"affiliate_id"=>"1", "clicks"=>"20645"}}], "current"=>50, "count"=>1, "page"=>1}, "errors"=>[], "status"=>1}}
      end

      def response_for_report_getconversions(params)
        {"response"=>{"data"=>{"pageCount"=>1, "data"=>[{"Stat"=>{"affiliate_id"=>"1", "payout"=>"100.00"}}], "current"=>50, "count"=>1, "page"=>1}, "errors"=>[], "status"=>1}}
      end

    end

    attr_accessor :code, :message, :body, :headers

    def initialize(code, message, body, headers)
      @code = code
      @message = message
      @body = body
      @headers = headers
    end

    def to_hash
      @headers
    end

  end
  
end
