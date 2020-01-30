[nemesis]

networkIdentifier = {{network_identifier}}
nemesisGenerationHash = {{nemesis_generation_hash}}
nemesisSignerPrivateKey = {{nemesis_signer_private_key}}

[cpp]

cppFileHeader =

[output]

cppFile =
binDirectory = ../seed/public-test

[namespaces]

symbol = true
symbol.xym = true

[namespace>symbol]

duration = 0

[mosaics]

symbol:xym = true

[mosaic>symbol:xym]

divisibility = 6
duration = 0
supply = 7'831'975'436'000'000
isTransferable = true
isSupplyMutable = false
isRestrictable = false

[distribution>symbol:xym]
{{#cat_currency_distribution}}
{{address}} = {{amount}}
{{/cat_currency_distribution}}

{{#cat_harvest_distribution}}
{{address}} = {{amount}}
{{/cat_harvest_distribution}}
