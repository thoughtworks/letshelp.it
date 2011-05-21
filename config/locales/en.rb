# coding: utf-8

{
  :en => {
    :i18n => {
        :language => {
            :name => 'English'
        },
    },
    #specific info for this app
    :forum => "Forum",
    :about => "About",
    :rights => "No rights reserved",
    :free_code => "Open source code at github",
    :wrong_password => "Invalid password",
    :no_organization_found => "No organization was found",
    :title => "Let's Help It!",
    :subtitle => "An application helping people to find organizations who need help",
    :howto_help => "What would you like to help with?",
    :contact_info => "E-mail, phone number, address, ...",
    :whereto_help => "Organization's city or name",
    :find => "Find!",
    :org_info => "Information about the organization",
    :announcer_info => "Information about the person that is registering this organization",
    :enter_password => "Enter the password",
    :validate => "Validate",
    :organization => {
      :register => "Register an organization",
      :update => "Update %{organization}'s information",
      :success_created => "Organization created with success",
      :success_updated => "Organization updated with success"
    },
    :org_form => {
      :name => "Name",
      :contact => "Ways of contact",
      :city => "City",
      :country => "Country",
      :tags => "Tags",
      :needs => "Needs",
      :edit_button => "Edit",
      :update_button => "Update",
      :create_button => "Register",
      :announcer => "Announcer",
      :password => "Password",
      :email => "E-mail"
    },
    :tag => {
      :food => "Food",
      :clothes => "Clothes",
      :volunteer_work => "Volunteer work",
      :money => "Money",
      :others => "Others"
    },
    :twitter_share => {
      :please_help => "Please, help ",
      :button => "Share in Twitter"
    },
    #transformed from http://github.com/svenfuchs/rails-i18n/
    :number => {
      :format => {
        :separator => ".",
        :precision => 3,
        :delimiter => ","
      },
      :human => {
        :format => {
          :precision => 1,
          :delimiter => ""
        },
        :storage_units => {
          :format => "%n %u",
          :units => {
            :kb => "KB",
            :tb => "TB",
            :gb => "GB",
            :byte => {
              :one => "Byte",
              :other => "Bytes"
            },
            :mb => "MB"
          }
        }
      },
      :percentage => {
        :format => {
          :delimiter => ""
        }
      },
      :precision => {
        :format => {
          :delimiter => ""
        }
      },
      :currency => {
        :format => {
          :format => "%u%n",
          :unit => "\302\243",
          :separator => ".",
          :precision => 2,
          :delimiter => ","
        }
      }
    },
    :activerecord => {
      :errors => {
        :messages => {
          :record_invalid => "Validation failed: {{errors}}",
          :greater_than_or_equal_to => "must be greater than or equal to {{count}}",
          :less_than_or_equal_to => "must be less than or equal to {{count}}",
          :confirmation => "doesn't match confirmation",
          :not_an_integer => "must be an integer",
          :blank => "can't be blank",
          :invalid => "is invalid",
          :exclusion => "is reserved",
          :odd => "must be odd", 
          :even => "must be even", 
          :wrong_length => "is the wrong length (should be {{count}} characters)", 
          :too_short => "is too short (minimum is {{count}} characters)", 
          :empty => "can't be empty", 
          :less_than => "must be less than {{count}}", 
          :equal_to => "must be equal to {{count}}", 
          :greater_than => "must be greater than {{count}}", 
          :taken => "has already been taken", 
          :too_long => "is too long (maximum is {{count}} characters)",
          :accepted => "must be accepted", 
          :not_a_number => "is not a number", 
          :inclusion => "is not included in the list"
        }
      }
    }, 
    :time => {
      :am => "am", 
      :formats => {
        :default => "%a, %d %b %Y %H:%M:%S %z", 
        :short => "%d %b %H:%M", 
        :long => "%B %d, %Y %H:%M"
      }, 
      :pm => "pm"
    },
    :date => {
      :month_names => [nil, "January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"], 
      :order => [:year, :month, :day], 
      :abbr_day_names => ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"],
      :formats => { "default" => "%d-%m-%Y", 
        :short => "%b %d", 
        :long => "%B %d, %Y"
      }, 
      :day_names => ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"], 
      :abbr_month_names => [nil, "Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"]
    }, 
    :activemodel => {
      :errors => {
        :template => {
          :body => "There were problems with the following fields:", 
          :header => {
            :one => "1 error prohibited this {{model}} from being saved", 
            :other => "{{count}} errors prohibited this {{model}} from being saved"
          }
        }
      }
    }, 
    :support => {
      :array => {
        :last_word_connector => ", and ", 
        :words_connector => ", ",
        :two_words_connector => " and "
      }
    }, 
    :datetime => {
      :prompts => {
        :minute => "Minute", 
        :second => "Seconds", 
        :month => "Month",
        :hour => "Hour", 
        :day => "Day", 
        :year => "Year"
      },
      :distance_in_words => {
        :less_than_x_minutes => {
          :one => "less than a minute",
          :other => "less than {{count}} minutes"
        },
        :almost_x_years => {
          :one => "almost 1 year", 
          :other => "almost {{count}} years"
        },
        :x_days => {
          :one => "1 day", 
          :other => "{{count}} days"
        }, 
        :x_seconds => {
          :one => "1 second", 
          :other => "{{count}} seconds"
        },
        :x_months => {
          :one => "1 month", 
          :other => "{{count}} months"
        }, 
        :about_x_hours => {
          :one => "about 1 hour", 
          :other => "about {{count}} hours"
        }, 
        :x_minutes => {
          :one => "1 minute", 
          :other => "{{count}} minutes"
        },
        :less_than_x_seconds => {
          :one => "less than 1 second", 
          :other => "less than {{count}} seconds"
        },
        :about_x_years => {
          :one => "about 1 year", 
          :other => "about {{count}} years"
        },
        :about_x_months => {
          :one => "about 1 month", 
          :other => "about {{count}} months"
        }, 
        :over_x_years => {
          :one => "over 1 year", 
          :other => "over {{count}} years"
        },
        :half_a_minute => "half a minute"
      }
    }
  }
}

