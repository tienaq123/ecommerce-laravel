<?php

declare(strict_types=1);

namespace App\Http\Enums;

use BenSampo\Enum\Enum;

final class PaginateDefault extends Enum
{
    public const PER_PAGE = 10;
    public const FIRST_PAGE = 1;
}
