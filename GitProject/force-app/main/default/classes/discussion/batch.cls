/**
 * 保安承認の更新希望日＝TODAY（）の場合、サービスのレコードを更新するバッチ
 */
global class InspectApprovalServiceUpdateBatch implements Database.Batchable<sObject>,Database.Stateful,Schedulable {
    // エラーログ
    List<Log__c> listLog;
    private Boolean isError = false;

    /**
     * コンストラクタ
     */
    global InspectApprovalServiceUpdateBatch () {
        listLog = new List<Log__c>();
    }

    // スケジュール
    global void execute(SchedulableContext ctx) {
        Database.executeBatch(new InspectApprovalServiceUpdateBatch());
    }

    /**
     * 開始処理
     * @param BC コンテキスト
     */
    global Database.QueryLocator start(Database.BatchableContext BC){
         return Database.getQueryLocator(
                [SELECT Id
                    ,Service__c
                    ,Engineer__c
                    ,Delegatee__c
                    ,HoanContractStartDate__c
                    ,HoanContractEndDate__c
                    ,EquipmentType__c
                    ,Voltage__c
                    ,EquipmentClass__c
                    ,EQCapacity__c
                    ,EmergencyGenarator__c
                    ,EMMotor__c
                    ,EMCapacity__c
                    ,EMVoltage__c
                    ,EMMAxOutput__c
                    ,GeneratorTYpe__c
                    ,GNMortor__c
                    ,GNCapacity__c
                    ,GNVoltage__c
                    ,GNMaxOutput__c
                    ,GMFrequency__c
                    ,SolarGeneratorCapacity__c
                    ,MonthlyFeePay__c
                    ,AnnualFeePay__c
                    ,TotalContractFee__c
                    ,ChargeDestinationType__c
                    ,ChargeType__c
                    ,BillingTo__c
                    ,ChargeDocument__c
                    ,ChargeAmountApr__c
                    ,ChargeAmountMay__c
                    ,ChargeAmountJun__c
                    ,ChargeAmountJul__c
                    ,ChargeAmountAug__c
                    ,ChargeAmountSep__c
                    ,ChargeAmountOct__c
                    ,ChargeAmountNov__c
                    ,ChargeAmountDec__c
                    ,ChargeAmountJan__c
                    ,ChargeAmountFeb__c
                    ,ChargeAmountMar__c
                    ,BillingRemarks__c
                FROM InspectionApproval__c
                WHERE UpdateHopeDay__c = TODAY
                AND ApprovedFlag__c = True
                ]);
    }

     /**
     * バッチ処理内容
     * @param BC  コンテキスト
     * @param InspectionApproval__c 対象データ
     */
    global void execute(Database.BatchableContext BC, List<InspectionApproval__c> scope) {
        try {
            List<Service__c> upserList = new List<Service__c>();
            for(InspectionApproval__c insApproval : scope) {
                Service__c ser = new Service__c();
                // サービスID
                if (String.isNotEmpty(insApproval.Service__c)){
                    ser.Id = insApproval.Service__c;
                }
                // 電気管理技術者
                if (String.isNotEmpty(insApproval.Engineer__c)) {
                    ser.Engineer__c = insApproval.Engineer__c;
                } 
                // 保安受託者区分
                if (String.isNotEmpty(insApproval.Delegatee__c)) {
                    ser.Delegatee__c = insApproval.Delegatee__c;
                } 
                // 受託開始日
                if (insApproval.HoanContractStartDate__c != null) {
                    ser.HoanContractStartDate__c = insApproval.HoanContractStartDate__c;
                } 
                // 受託終了日
                if (insApproval.HoanContractEndDate__c != null) {
                    ser.HoanContractEndDate__c = insApproval.HoanContractEndDate__c;
                } 
                // 需要設備
                if (String.isNotEmpty(insApproval.EquipmentType__c)) {
                    ser.EquipmentType__c = insApproval.EquipmentType__c;
                } 
                // 受電電圧(V)
                if (insApproval.Voltage__c != null) {
                    ser.Voltage__c = insApproval.Voltage__c;
                } 
                // 需要設備種類
                if (String.isNotEmpty(insApproval.EquipmentClass__c)) {
                    ser.EquipmentClass__c = insApproval.EquipmentClass__c;
                } 
                // 需要設備容量(kVA)
                if (insApproval.EQCapacity__c != null) {
                    ser.EQCapacity__c = insApproval.EQCapacity__c;
                } 
                // 非常用予備発電装置
                if (insApproval.EmergencyGenarator__c != null) {
                    ser.EmergencyGenarator__c = insApproval.EmergencyGenarator__c;
                } 
                // 非常用原動機種類
                if (String.isNotEmpty(insApproval.EMMotor__c)) {
                    ser.EMMotor__c = insApproval.EMMotor__c;
                } 
                // 非常用予備発電機定格容量(kVA)
                if (insApproval.EMCapacity__c != null) {
                    ser.EMCapacity__c = insApproval.EMCapacity__c;
                } 
                // 非常用予備発電機定格電圧(V)
                if (insApproval.EMVoltage__c != null) {
                    ser.EMVoltage__c = insApproval.EMVoltage__c;
                } 
                // 非常用予備発電機最大出力(kW)
                if (insApproval.EMMAxOutput__c != null) {
                    ser.EMMAxOutput__c = insApproval.EMMAxOutput__c;
                } 
                // 発電所
                if (insApproval.GeneratorTYpe__c != null) {
                    ser.GeneratorTYpe__c = insApproval.GeneratorTYpe__c;
                } 
                // 常用原動機種類
                if (insApproval.GNMortor__c != null) {
                    ser.GNMortor__c = insApproval.GNMortor__c;
                } 
                // 常用発電機定格容量(kVA)
                if (insApproval.GNCapacity__c != null) {
                    ser.GNCapacity__c = insApproval.GNCapacity__c;
                } 
                // 常用発電機定格電圧(V)
                if (insApproval.GNVoltage__c != null) {
                    ser.GNVoltage__c = insApproval.GNVoltage__c;
                }
                // 常用発電機最大出力(kW)
                if (insApproval.GNMaxOutput__c != null) {
                    ser.GNMaxOutput__c = insApproval.GNMaxOutput__c;
                }
                // 常用発電点検周期 
                if (insApproval.GMFrequency__c != null) {
                    ser.GMFrequency__c = insApproval.GMFrequency__c;
                }
                // 太陽電池発電所専用受変電設備容量(kVA) 
                if (insApproval.SolarGeneratorCapacity__c != null) {
                    ser.SolarGeneratorCapacity__c = insApproval.SolarGeneratorCapacity__c;
                }
                // 月次点検保安管理料(月額)(税抜)
                if (insApproval.MonthlyFeePay__c != null) {
                    ser.MonthlyFeePay__c = insApproval.MonthlyFeePay__c;
                }
                // 年次点検保安管理料(年額)(税抜)
                if (insApproval.AnnualFeePay__c != null) {
                    ser.AnnualFeePay__c = insApproval.AnnualFeePay__c;
                }
                // 契約合計金額(月額)(税抜)
                if (insApproval.TotalContractFee__c != null) {
                    ser.TotalContractFee__c = insApproval.TotalContractFee__c;
                }
                // 請求先区分
                if (String.isNotEmpty(insApproval.ChargeDestinationType__c)) {
                    ser.ChargeDestinationType__c = insApproval.ChargeDestinationType__c;
                }
                // 請求方法 
                if (String.isNotEmpty(insApproval.ChargeType__c)) {
                    ser.ChargeType__c = insApproval.ChargeType__c;
                }
                // 請求先コ―ド 
                if (String.isNotEmpty(insApproval.BillingTo__c)) {
                    ser.BillingTo__c = insApproval.BillingTo__c;
                }
                // 発行書類 
                if (String.isNotEmpty(insApproval.ChargeDocument__c)) {
                    ser.ChargeDocument__c = insApproval.ChargeDocument__c;
                }
                // 4月度請求金額(税抜) 
                if (insApproval.ChargeAmountApr__c != null) {
                    ser.ChargeAmountApr__c = insApproval.ChargeAmountApr__c;
                }
                // 5月度請求金額(税抜) 
                if (insApproval.ChargeAmountMay__c != null) {
                    ser.ChargeAmountMay__c = insApproval.ChargeAmountMay__c;
                }
                // 6月度請求金額(税抜)
                if (insApproval.ChargeAmountJun__c != null) {
                    ser.ChargeAmountJun__c = insApproval.ChargeAmountJun__c;
                }
                // 7月度請求金額(税抜)
                if (insApproval.ChargeAmountJul__c != null) {
                    ser.ChargeAmountJul__c = insApproval.ChargeAmountJul__c;
                }
                // 8月度請求金額(税抜)
                if (insApproval.ChargeAmountAug__c != null) {
                    ser.ChargeAmountAug__c = insApproval.ChargeAmountAug__c;
                }
                // 9月度請求金額(税抜)
                if (insApproval.ChargeAmountSep__c != null) {
                    ser.ChargeAmountSep__c = insApproval.ChargeAmountSep__c;
                }
                // 10月度請求金額(税抜)
                if (insApproval.ChargeAmountOct__c != null) {
                    ser.ChargeAmountOct__c = insApproval.ChargeAmountOct__c;
                }
                // 11月度請求金額(税抜)
                if (insApproval.ChargeAmountNov__c != null) {
                    ser.ChargeAmountNov__c = insApproval.ChargeAmountNov__c;
                }
                // 12月度請求金額(税抜)
                if (insApproval.ChargeAmountDec__c != null) {
                    ser.ChargeAmountDec__c = insApproval.ChargeAmountDec__c;
                }
                // 1月度請求金額(税抜)
                if (insApproval.ChargeAmountJan__c != null) {
                    ser.ChargeAmountJan__c = insApproval.ChargeAmountJan__c;
                }
                // 2月度請求金額(税抜)
                if (insApproval.ChargeAmountFeb__c != null) {
                    ser.ChargeAmountFeb__c = insApproval.ChargeAmountFeb__c;
                }
                // 3月度請求金額(税抜)
                if (insApproval.ChargeAmountMar__c != null) {
                    ser.ChargeAmountMar__c = insApproval.ChargeAmountMar__c;
                }
                // 請求特記事項
                if (String.isNotEmpty(insApproval.BillingRemarks__c)) {
                    ser.BillingRemarks__c = insApproval.BillingRemarks__c;
                }
                upserList.add(ser);
            }
            if(upserList.size() > 0) update upserList;
        } catch (Exception e) {
            Log__c tempLog = new Log__c();
            tempLog.Status__c = '異常終了';
            tempLog.Content__c = '保安承認の更新希望日＝TODAY（）の場合、サービスのレコードを更新するバッチエラー\r\n<実行時エラー>\r\n' + e.getMessage() + '\r\n<StackTrace>\r\n' + e.getStackTraceString();
            listLog.add(tempLog);
        }
    }

    /**
     * 終了処理
     * @param BC  [description]
     */
    global void finish(Database.BatchableContext BC){
       //ログを登録
       if(!listLog.isEmpty()) insert listLog;
    }
}