<?php
// sms.php
require 'vendor/autoload.php';
use AfricasTalking\SDK\AfricasTalking;

class Sms
{
    protected $phone;
    protected $AT;

    function __construct($phone)
    {
        $this->phone = $phone;
        $this->AT = new AfricasTalking("sandbox", "atsk_3fc7707d1713920f6ceb2a819f2c7522b46a733c4e8ad8a8cdd26408eb2c816a670b3640");
    }

    public function sendSMS($message, $recipients)
    {
        $sms = $this->AT->sms();
        $result = $sms->send([
            'username' => "sandbox",
            'to' => $recipients,
            'message' => $message,
            'from' => "Ghislaine"
        ]);

        return $result;
    }
}
?>