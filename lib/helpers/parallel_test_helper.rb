# class Helpers::ParallelTestHelper
#   def self.tags
#     {
#       "tags" ['@messenger', '@account_management', '@analytics', '@messenger_admin', '@page_manager', '@gallery']
#     }
#   end

#   def self.runtask(configs, cuke_task)
#     configs.each { |key,value| puts sh %{ xterm -T "#{value[:tag]}" -e "rake #{cuke_task}  ; read -p 'Press enter to close window'"& }}
#   end
# end
