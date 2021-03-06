module WPScan
  module Finders
    module InterestingFindings
      # Tmm DB Migrate finder
      class TmmDbMigrate < CMSScanner::Finders::Finder
        # @return [ InterestingFinding ]
        def aggressive(_opts = {})
          path = 'wp-content/uploads/tmm_db_migrate/tmm_db_migrate.zip'
          url  = target.url(path)
          res  = Browser.get(url)

          return unless res.code == 200 && res.headers['Content-Type'] =~ %r{\Aapplication/zip}i

          WPScan::TmmDbMigrate.new(
            url,
            confidence: 100,
            found_by: DIRECT_ACCESS,
            references: { packetstorm: 131_957 }
          )
        end
      end
    end
  end
end
