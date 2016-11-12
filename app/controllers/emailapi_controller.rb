def index
end

def send_campaign

    gb = Gibbon::Request.new
    segment_id = gb.list_static_segment_add(:id => 8a17250531, :name => "credit")
    emails_added = gb.list_static_segment_members_add( :id => 8a17250531,
                                                       :seg_id => segment_id,
                                                       :batch =>  )

    settings = {
        subject_line: "You have received store credit",
        title: "deCODE",
        from_name: "deCODE MTL",
        reply_to: "xycong@uwaterloo.ca"
    }

    body = {
        type: "regular",
        recipients: {
            list_id: 8a17250531,
            segment_opts: {
                saved_segment_id: segment_id
            }
        }
        settings: settings
    }

    begin
        campaign_id = gb.campaigns.create(body: body)
    rescue Gibbon::MailChimpError => e
        puts "Problem: #{e.message} - #{e.raw_body}"
    end

    gb.campaigns(campaign_id).actions.send.create
end