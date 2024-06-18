<?php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Mail\Mailable;
use Illuminate\Mail\Mailables\Content;
use Illuminate\Mail\Mailables\Envelope;
use Illuminate\Queue\SerializesModels;

class OrderMail extends Mailable
{
    use Queueable, SerializesModels;

    /**
     * Create a new message instance.
     */

    public $details;
    public $orderDetails;
    public $companyDetails;
    public $locationDetails;
    public $logo;
    public function __construct($orderType, $orderDetails, $companyDetails, $locationDetails, $logo)
    {
        $this->orderType = $orderType;
        $this->orderDetails = $orderDetails;
        $this->companyDetails = $companyDetails;
        $this->locationDetails = $locationDetails;
        $this->logo = $logo;
    }

    /**
     * Get the message envelope.
     */
    public function build()
    {
        $orderDetails = $this->orderDetails;
        $companyDetails = $this->companyDetails;
        $locationDetails = $this->locationDetails;
        $logo = $this->logo;
        if ($this->orderType === "Confirmation") {
            return $this->subject("Your order placed successfully by Royal Dry Fruits")
                ->view('emails.order_confirmation', compact('orderDetails', 'companyDetails', 'locationDetails', 'logo'));
        } else {
            return $this->subject("Your order shipped successfully by Royal Dry Fruits")
                ->view('emails.order_shipment', compact('orderDetails', 'companyDetails', 'locationDetails', 'logo'));
        }
    }
}
