class MobileSignalFetcher::Network
  class Bars
    def initialize(db:)
      @db = db
    end

    def self.find(db)
      new(db: db).find
    end

    def find
      case db
      when -61..-50 then 5
      when -73..-62 then 4
      when -84..-74 then 3
      when -95..-85 then 2
      when -102..-96 then 1
      else
        0
      end
    end

    private

    def db
      @db.to_f.round
    end
  end
end
