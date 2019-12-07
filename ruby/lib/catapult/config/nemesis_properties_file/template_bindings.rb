#    Copyright 2018 Tech Bureau, Corp
# 
#    Licensed under the Apache License, Version 2.0 (the "License");
#    you may not use this file except in compliance with the License.
#    You may obtain a copy of the License at
# 
#        http://www.apache.org/licenses/LICENSE-2.0
# 
#    Unless required by applicable law or agreed to in writing, software
#    distributed under the License is distributed on an "AS IS" BASIS,
#    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#    See the License for the specific language governing permissions and
#    limitations under the License.
module Catapult
  class Config
    class NemesisPropertiesFile
      module TemplateBindings
        XEM_TOTAL_SUPPLY   = "7'831'975'436'000'000"
	XEM_ACCOUNT_SUPPLY = "391'598'771'800'000"
        XEM_NUM_OF_ACCOUNTS = 18 # this has to equal ration XEM_TOTAL_SUPPLY/XEM_ACCOUNT_SUPPLY
        def self.template_bindings(nemesis_keys_info)
          key_info_array = nemesis_keys_info.key_info_array
          generation_info = nemesis_keys_info.generation_info
          {
            network_identifier: generation_info.network_identifier,
            nemesis_generation_hash: generation_info.generation_hash,
            nemesis_signer_private_key: generation_info.signer_private_key,
            cat_harvest_distribution: cat_harvest_distribution(key_info_array),
            cat_currency_distribution: cat_currency_distribution(key_info_array)
          }
        end
        
        private

        # TODO: hard coding until we figure out how to dynamically compute the mosaic ids in network config
        NUM_HARVEST_KEYS        = 20
	HARVEST_KEY_INDEX_START = 18
	HARVEST_KEY_INDEX_END   = NUM_HARVEST_KEYS + HARVEST_KEY_INDEX_START
        HARVEST_ACCOUNT_SUPPLY = "39'159'877'180'000"
        def self.cat_harvest_distribution(key_info_array)
          key_info_array[0...NUM_HARVEST_KEYS].map { |key_info| distribution(key_info, HARVEST_ACCOUNT_SUPPLY) }
        end

        NUM_CURRENCY_KEYS       = 18 # this has to equal ration XEM_TOTAL_SUPPLY/XEM_ACCOUNT_SUPPLY
        CURRENCY_ACCOUNT_SUPPLY = XEM_ACCOUNT_SUPPLY
        def self.cat_currency_distribution(key_info_array)
          key_info_array[20...38].map { |key_info| distribution(key_info, CURRENCY_ACCOUNT_SUPPLY) }
        end

        def self.distribution(key_info, amount)
          {
            address: key_info.address,
            amount:  amount
          }
        end

      end
      
    end
  end
end



