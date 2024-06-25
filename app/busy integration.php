<?php
function isHostActive()
{
    $ch = curl_init("http://localhost:981");
    curl_setopt_array($ch, [CURLOPT_NOBODY => true, CURLOPT_TIMEOUT => 5]);
    if(curl_exec($ch) && ($code = curl_getinfo($ch, CURLINFO_HTTP_CODE)) >= 200 && $code < 400) {
        $response = getVouchersList();
        return (($response !== "") && ($response !== false));
    } else {
        return false;
    }
}

function getVouchersList()
{
    $curl = curl_init();

    curl_setopt_array($curl, [
        CURLOPT_URL => getenv("BUSY_URL"),
        CURLOPT_RETURNTRANSFER => true,
        CURLOPT_ENCODING => '',
        CURLOPT_MAXREDIRS => 10,
        CURLOPT_TIMEOUT => 0,
        CURLOPT_FOLLOWLOCATION => true,
        CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
        CURLOPT_CUSTOMREQUEST => 'POST',
        CURLOPT_HTTPHEADER => [
            'SC: 1',
            'Qry: select vchno from tran1 where vchtype=9 order by date desc',
            'UserName: a',
            'Pwd: a'
        ],
    ]);
    $response = curl_exec($curl);
    curl_close($curl);
    return $response;
}

function minifyXml($xml) {
    $dom = new DOMDocument();
    $dom->preserveWhiteSpace = false;
    $dom->formatOutput = false;
    $dom->loadXML($xml);

    // Save the XML as a string
    return $dom->saveXML($dom->documentElement);
}

function pushSaleVoucher()
{
    if (isHostActive()) {
//        $minified_xml = "<Sale><VchSeriesName>Main</VchSeriesName><Date>01-04-2024</Date><VchType>9</VchType><StockUpdationDate>01-04-2024</StockUpdationDate><STPTName>Local-Exempt</STPTName><MasterName1>Vignesh - 9876543210</MasterName1><MasterName2>Main Store</MasterName2><TranCurName>Rs.</TranCurName><InputType>1</InputType><ItemEntries><ItemDetail><Date>01-04-2024</Date><VchType>9</VchType><SrNo>1</SrNo><ItemName>Water Bottle</ItemName><Qty>12</Qty><Price>120</Price><Amt>1440</Amt><MC>Main Store</MC></ItemDetail><ItemDetail><Date>01-04-2024</Date><VchType>9</VchType><SrNo>2</SrNo><ItemName>Laptop</ItemName><Qty>10</Qty><Price>250</Price><Amt>2500</Amt><MC>Main Store</MC></ItemDetail></ItemEntries><POSVchData><CarrySettlement>True</CarrySettlement></POSVchData></Sale>";

        $xml = "<Sale>
    <VchSeriesName>Main</VchSeriesName>
    <Date>01-04-2024</Date>
    <VchType>9</VchType>
    <StockUpdationDate>01-04-2024</StockUpdationDate>
    <STPTName>Local-Exempt</STPTName>
    <MasterName1>Vignesh - 9876543210</MasterName1>
    <MasterName2>Main Store</MasterName2>
    <TranCurName>Rs.</TranCurName>
    <InputType>1</InputType>
    <ItemEntries>
        <ItemDetail>
            <Date>01-04-2024</Date>
            <VchType>9</VchType>
            <SrNo>1</SrNo>
            <ItemName>Water Bottle</ItemName>
            <UnitName>Dozen</UnitName>
            <AltUnitName>Dozen</AltUnitName>
            <ConFactor>1</ConFactor>
            <Qty>12</Qty>
            <QtyMainUnit>12</QtyMainUnit>
            <QtyAltUnit>12</QtyAltUnit>
            <ItemTaxCategory>&lt;&lt;---None---&gt;&gt;</ItemTaxCategory>
            <ItemDescInfo/>
            <Price>120</Price>
            <PriceAltUnit>120</PriceAltUnit>
            <ListPrice>120</ListPrice>
            <Amt>1440</Amt>
            <NettAmount>1440</NettAmount>
            <MC>Main Store</MC>
            <ItemSerialNoEntries/>
            <ParamStockEntries/>
            <BatchEntries/>
            <RecType>2</RecType>
        </ItemDetail>
    </ItemEntries>
    <POSVchData>
        <CarrySettlement>True</CarrySettlement>
    </POSVchData>
</Sale>";

        $minified_xml = minifyXml($xml);
        $curl = curl_init();
        curl_setopt_array($curl, [
            CURLOPT_URL => getenv("BUSY_URL"),
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_ENCODING => '',
            CURLOPT_MAXREDIRS => 10,
            CURLOPT_TIMEOUT => 0,
            CURLOPT_FOLLOWLOCATION => true,
            CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
            CURLOPT_CUSTOMREQUEST => 'POST',
            CURLOPT_HTTPHEADER => [
                'SC: 2',
                'Qry: select count(*) from tran1',
                'UserName: a',
                'Pwd: a',
                'vchtype: 9',
                "vchXml: $minified_xml"
            ],
        ]);
        $response = curl_exec($curl);
        curl_close($curl);
        return ($response != "");
    } else {
        echo "No Connection";
    }
}

