CREATE TABLE `data_platform_delivery_document_header_data`
(
    `DeliveryDocument`                         int(16) NOT NULL,
    `SupplyChainRelationshipID`                int(16) NOT NULL,
    `SupplyChainRelationshipDeliveryID`        int(6) NOT NULL,
    `SupplyChainRelationshipDeliveryPlantID`   int(4) NOT NULL,
    `SupplyChainRelationshipBillingID`         int(4) DEFAULT NULL,
    `SupplyChainRelationshipPaymentID`         int(2) DEFAULT NULL,
    `Buyer`                                    int(12) NOT NULL,
    `Seller`                                   int(12) NOT NULL,
    `DeliverToParty`                           int(12) NOT NULL,
    `DeliverFromParty`                         int(12) NOT NULL,
    `DeliverToPlant`                           varchar(4) NOT NULL,
    `DeliverFromPlant`                         varchar(4) NOT NULL,
    `BillToParty`                              int(12) DEFAULT NULL,
    `BillFromParty`                            int(12) DEFAULT NULL,
    `BillToCountry`                            varchar(3) DEFAULT NULL,
    `BillFromCountry`                          varchar(3) DEFAULT NULL,
    `Payer`                                    int(12) DEFAULT NULL,
    `Payee`                                    int(12) DEFAULT NULL,
    `IsExportImport`                           tinyint(1) DEFAULT NULL,
    `DeliverToPlantTimeZone`                   varchar(3) DEFAULT NULL,
    `DeliverFromPlantTimeZone`                 varchar(3) DEFAULT NULL,
    `ReferenceDocument`                        int(16) DEFAULT NULL,
    `ReferenceDocumentItem`                    int(6) DEFAULT NULL,
    `OrderID`                                  int(16) DEFAULT NULL,
    `OrderItem`                                int(6) DEFAULT NULL,
    `ContractType`                             varchar(4) DEFAULT NULL,
    `OrderValidityStartDate`                   date DEFAULT NULL,
    `OrderValidityEndDate`                     date DEFAULT NULL,
    `DocumentDate`                             date DEFAULT NULL,
    `PlannedGoodsIssueDate`                    date DEFAULT NULL,
    `PlannedGoodsIssueTime`                    time DEFAULT NULL,
    `PlannedGoodsReceiptDate`                  date DEFAULT NULL,
    `PlannedGoodsReceiptTime`                  time DEFAULT NULL,
    `InvoiceDocumentDate`                      date DEFAULT NULL,
    `HeaderCompleteDeliveryIsDefined`          tinyint(1) DEFAULT NULL,
    `HeaderDeliveryStatus`                     varchar(2) DEFAULT NULL,
    `CreationDate`                             date DEFAULT NULL,
    `CreationTime`                             time DEFAULT NULL,
    `LastChangeDate`                           date DEFAULT NULL,
    `LastChangeTime`                           time DEFAULT NULL,    
    `GoodsIssueOrReceiptSlipNumber`            varchar(35) DEFAULT NULL,
    `HeaderBillingStatus`                      varchar(2) DEFAULT NULL,
    `HeaderBillingConfStatus`                  varchar(2) DEFAULT NULL,
    `HeaderBillingBlockStatus`                 tinyint(1) DEFAULT NULL,
    `HeaderGrossWeight`                        float(15) DEFAULT NULL,
    `HeaderNetWeight`                          float(15) DEFAULT NULL,
    `HeaderWeightUnit`                         varchar(3) DEFAULT NULL,
    `Incoterms`                                varchar(3) DEFAULT NULL,
    `TransactionCurrency`                      varchar(5) DEFAULT NULL,
    `HeaderDeliveryBlockStatus`                tinyint(1) DEFAULT NULL,
    `HeaderIssuingBlockStatus`                 tinyint(1) DEFAULT NULL,
    `HeaderReceivingBlockStatus`               tinyint(1) DEFAULT NULL,
    `IsCancelled`                              tinyint(1) DEFAULT NULL,
    `IsMarkedForDeletion`                      tinyint(1) DEFAULT NULL,
    
    PRIMARY KEY (`DeliveryDocument`),

    CONSTRAINT `DataPlatformDeliveryDocumentHeaderDataSupplyChainRelationshipDeliveryID_fk` FOREIGN KEY (`SupplyChainRelationshipID`, `SupplyChainRelationshipDeliveryID`, `Buyer`, `Seller`, `DeliverToParty`, `DeliverFromParty`) REFERENCES `data_platform_supply_chain_relationship_delivery_relation_data` (`SupplyChainRelationshipID`, `SupplyChainRelationshipDeliveryID`, `Buyer`, `Seller`, `DeliverToParty`, `DeliverFromParty`),
    CONSTRAINT `DataPlatformDeliveryDocumentHeaderDataSupplyChainRelationshipDeliveryPlantID_fk` FOREIGN KEY (`SupplyChainRelationshipID`, `SupplyChainRelationshipDeliveryID`, `SupplyChainRelationshipDeliveryPlantID`, `Buyer`, `Seller`, `DeliverToParty`, `DeliverFromParty`, `DeliverToPlant`, `DeliverFromPlant`) REFERENCES `data_platform_supply_chain_relationship_delivery_plant_relation_data` (`SupplyChainRelationshipID`, `SupplyChainRelationshipDeliveryID`, `SupplyChainRelationshipDeliveryPlantID`, `Buyer`, `Seller`, `DeliverToParty`, `DeliverFromParty`, `DeliverToPlant`, `DeliverFromPlant`),
    CONSTRAINT `DataPlatformDeliveryDocumentHeaderDataSupplyChainRelationshipBillingID_fk` FOREIGN KEY (`SupplyChainRelationshipID`, `SupplyChainRelationshipBillingID`, `Buyer`, `Seller`, `BillToParty`, `BillFromParty`) REFERENCES `data_platform_supply_chain_relationship_billing_relation_data` (`SupplyChainRelationshipID`, `SupplyChainRelationshipBillingID`, `Buyer`, `Seller`, `BillToParty`, `BillFromParty`),
    CONSTRAINT `DataPlatformDeliveryDocumentHeaderDataSupplyChainRelationshipPaymentID_fk` FOREIGN KEY (`SupplyChainRelationshipID`, `SupplyChainRelationshipBillingID`, `SupplyChainRelationshipPaymentID`, `Buyer`, `Seller`, `BillToParty`, `BillFromParty`, `Payer`, `Payee`) REFERENCES `data_platform_supply_chain_relationship_payment_relation_data` (`SupplyChainRelationshipID`, `SupplyChainRelationshipBillingID`, `SupplyChainRelationshipPaymentID`, `Buyer`, `Seller`, `BillToParty`, `BillFromParty`, `Payer`, `Payee`),
    CONSTRAINT `DataPlatformDeliveryDocumentHeaderDataBillToCountry_fk` FOREIGN KEY (`BillToCountry`) REFERENCES `data_platform_country_country_data` (`Country`),
    CONSTRAINT `DataPlatformDeliveryDocumentHeaderDataBillFromCountry_fk` FOREIGN KEY (`BillFromCountry`) REFERENCES `data_platform_country_country_data` (`Country`),
    CONSTRAINT `DataPlatformDeliveryDocumentHeaderDataOrderItem_fk` FOREIGN KEY (`OrderID`, `OrderItem`) REFERENCES `data_platform_orders_item_data` (`OrderID`, `OrderItem`),
    CONSTRAINT `DataPlatformDeliveryDocumentHeaderDataDeliverToPlantTimeZone_fk` FOREIGN KEY (`DeliverToPlant`) REFERENCES `data_platform_time_zone_time_zone_data` (`TimeZone`),
    CONSTRAINT `DataPlatformDeliveryDocumentHeaderDataDeliverFromPlantTimeZone_fk` FOREIGN KEY (`DeliverFromPlantTimeZone`) REFERENCES `data_platform_time_zone_time_zone_data` (`TimeZone`),
    CONSTRAINT `DataPlatformDeliveryDocumentHeaderDataHeaderWeightUnit_fk` FOREIGN KEY (`HeaderWeightUnit`) REFERENCES `data_platform_quantity_unit_quantity_unit_data` (`QuantityUnit`),    
    CONSTRAINT `DataPlatformDeliveryDocumentHeaderDataIncoterms_fk` FOREIGN KEY (`Incoterms`) REFERENCES `data_platform_incoterms_incoterms_data` (`Incoterms`),
    CONSTRAINT `DataPlatformDeliveryDocumentHeaderDataTransactionCurrency_fk` FOREIGN KEY (`TransactionCurrency`) REFERENCES `data_platform_currency_currency_data` (`Currency`)

) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4;
